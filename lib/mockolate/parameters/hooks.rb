# frozen_string_literal: true

# frozen_string_literal: true

class Mockolate::Parameters
  module Hooks
    def self.included(base)
      base.extend ClassInitializers
    end
    
    module ClassInitializers
      # Function runs after a class inherited from Mockolate::Parameters
      # @params [Class] class to override
      def initialize!(base)
        base.class_eval do
          # Included modules
          include Mockolate::Parameters::Attributes::Macros
          # include Mockolate::Parameters::Generator
          # include Mockolate::Parameters::Attributes

          # class variables and attributes
          class_variable_set :@@_public_attributes, {}
        end
      end
    end
  
  end  
end