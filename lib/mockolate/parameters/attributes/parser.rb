# frozen_string_literal: true

require "mockolate/parameters/attributes/types"

module Mockolate::Parameters::Attributes
  module Parser
    include Mockolate::Parameters::Attributes::Types
    
    def parse!(obj, &block)
      return _parse_attribute_from_symbol(obj, &block) if obj.kind_of? Symbol
      return _parse_attributes_from_array(obj) if obj.kind_of? Array
    end

    private
    def _parse_attributes_from_array(attrs) 
      attrs.map do |attr|
        _parse_attribute_from_symbol(attr)
      end
    end

    def _parse_attribute_from_symbol(sym, type = :string, &block)
      return yield if block_given? 

      class_variable_get(:@@_public_attributes).merge!({sym => method(type).call(sym)})
    end

    def _parse_attribute_from_hash(obj)
    end
  end  
end