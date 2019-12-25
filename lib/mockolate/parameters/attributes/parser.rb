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
        # string attr && next if attr.kind_of? Symbol
      end
    end

    def _parse_attribute_from_symbol(sym, &block)
      # hash = sym
      class_variable_get(:@@_public_attributes).merge!(yield) if block_given? 
    end

    def _parse_attribute_from_hash(obj)
    end
  end  
end