# frozen_string_literal: true

module Mockolate::Parameters::Attributes
  module Types

    def string(name, from_nested = nested?)
      return {value: '', type: :string} unless from_nested
      class_variable_get(:@@_nested_attributes_array).merge!(name.to_sym => {value: '', type: :string})
    end

    def integer(name, from_nested = nested?)
      return {value: 0, type: :integer} unless from_nested
      class_variable_get(:@@_nested_attributes_array).merge!(name.to_sym =>{value: 0, type: :integer})
    end
  
    def nested_type_hander(&block)
      class_variable_set :@@_nested_attributes_array, {}
      $nested = true
      yield
      $nested = false
      return class_variable_get :@@_nested_attributes_array
    end

    private
    def nested?
      $nested
    end
  end
end