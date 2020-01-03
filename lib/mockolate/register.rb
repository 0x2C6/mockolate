# frozen_string_literal: true

module Mockolate::Register
  @@types = {}

  def self.set(type, type_module)
    @@types[type] = type_module
  end

  def self.get(type)
    @@types[type]
  end
end