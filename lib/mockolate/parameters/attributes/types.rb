# frozen_string_literal: true

module Mockolate::Parameters::Attributes
  module Types
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def string(name)
      end

      def integer(name)
      end
    end
  end  
end