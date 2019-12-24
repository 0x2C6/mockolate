# frozen_string_literal: true

class Mockolate::Parameters
  module Generator
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      # def generate
      #   {is_dummy: 'Yes'}
      # end
    end
  end  
end