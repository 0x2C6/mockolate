# frozen_string_literal: true

class Mockolate::Request
  @@public_attributes = []
  @@payload_options   = {}

  def self.payload(options = {}, &block)
    @@payload_options = options
    dsl = DSL.new
    dsl.instance_exec(&block)
    @@public_attributes << dsl.attributes
  end

  def self.params
    @@public_attributes
  end

  def self.generate_array!(count = nil)
    attr_arr = @@public_attributes * (count || 1)
    parser = Parser.new(attr_arr)
    parser.parse
  end

  def self.generate_hash!(count = nil)
    attr_arr = @@public_attributes * (count || 1)
    parser = Parser.new(attr_arr, @@payload_options)
    parser.parse
  end

  class DSL
    attr_accessor :attributes
    
    def initialize
      @attributes = []
    end

    def hash(*args, &block)
      raise Mockolate::Errors::MissingHashBlockError unless block_given?
      method_missing(:hash, *args, &block)
    end

    def method_missing(type, *args, &block)
      metadata   = Mockolate::Register.get(type)
      field_name = args.first
      options    = args[1]
      
      attibute = metadata.create(name: field_name, options: options)
      if block_given?
        attibute.children = Mockolate::Request.payload(&block)
      end
      attributes << attibute
    end
  end

end