# frozen_string_literal: true

module Mockolate::Parameters::Attributes
  module Types
    def string(name)
      {name.to_sym => {value: '', type: :string} }
    end

    def integer(name)
      {name.to_sym => {value: 0, type: :integer}}
    end
  
  end  
end