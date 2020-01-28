# frozen_string_literal: true

class Mockolate::Request
  @@public_attributes = []
  @@payloads = []
  @@payload_options   = {}

  def self.payload(options = {}, &block)
    @@payloads << payload_parser(options, &block)
  end

  def self.payload_parser(options = {}, &block)
    @@payload_options = options
    dsl = DSL.new(@@payload_options)
    dsl.instance_exec(&block)
    @@public_attributes = dsl.attributes
  end

  def self.params
    @@public_attributes
  end

  def generate_array!(count = nil)
    attr_arr = @@payloads
    parser = Parser.new(attr_arr)
    parser.parse
  end

  def generate_hash!(count = nil)
    attr_arr = @@payloads
    parser = Parser.new(attr_arr, @@payload_options)
    parser.parse
  end

  class DSL
    attr_accessor :attributes
    attr_reader   :options
    
    def initialize(options)
      @attributes = []
      @options    = options  
    end

    def hash(*args, &block)
      raise Mockolate::Errors::MissingHashBlockError unless block_given?
      method_missing(:hash, *args, &block)
    end

    def method_missing(type, *args, &block)
      metadata   = Mockolate::Register.get(type)
      field_name = args.first
      type_options    = args[1]
      
      attibute = metadata.create(name: field_name, options: type_options)
      if block_given?
        attibute.children = Mockolate::Request.payload_parser(options, &block)
      end
      attributes << attibute
    end
  end

end