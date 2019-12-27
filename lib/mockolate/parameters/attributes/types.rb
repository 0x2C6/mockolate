# frozen_string_literal: true

module Mockolate::Parameters::Attributes
  module Types
    def string(name)
      # class_variable_get(:@@_public_attributes).merge!(
        {value: '', type: :string}
      # )
    end

    def integer(name)
      class_variable_get(:@@_public_attributes).merge!(
        name.to_sym => {value: 0, type: :integer}
      )
    end
  
    # def type_hander(&block)

    # end
  end  
end