# frozen_string_literal: true

# frozen_string_literal: true

class Mockolate::Parameters
  module Hooks
    def self.included(base)
      base.extend ClassInitializers
    end
    
    module ClassInitializers
      def initialize!(base)
        base.class_eval do
          class_variable_set :@@_public_attributes, []
        end
      end
    end
  end  
end