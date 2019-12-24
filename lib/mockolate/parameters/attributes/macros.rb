# frozen_string_literal: true

# require "mockolate/parameters/attributes/types"

module Mockolate::Parameters::Attributes
  # This module includes main macros definitions
  module Macros
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      # Handles single attribute which may have constant values
      # @param attr [String] key of attribute
      # @yield block
      def attribute(attr, &block)
        class_variable_get(:@@_public_attributes).push attr: {}
      end

      # Handles multiple attributes
      # @param attrs [Array<String>] key of attribute
      def attributes(*attrs)
        attr.each do |attr|
          return parse_hash(attr) if attr.is_a? Hash
          parse_symbol
        end
        class_variable_get(:@@_public_attributes).push *attrs
      end
    end
  end  
end