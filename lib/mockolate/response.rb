# frozen_string_literal: true

class Mockolate::Response
  @@object_class = nil

  def self.define_endpoint!(mtd, &block)
    method(:define_method).call(mtd, &block)
  end

  def object
    @@object_class.generate_hash!
  end

  def self.object_from(request_class)
    raise Exception unless request_class.new.is_a? Mockolate::Request
    @@object_class = request_class.new 
  end
end