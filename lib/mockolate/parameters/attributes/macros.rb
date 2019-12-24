# frozen_string_literal: true

# require "mockolate/parameters/attributes/types"

module Mockolate::Parameters::Attributes
  module Macros
    # include Mockolate::Parameters::Attributes::Types
    
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def attribute(attr, &block)
      end

      def attributes(*attrs)
      end
    end
  end  
end