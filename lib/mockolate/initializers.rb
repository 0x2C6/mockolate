# frozen_string_literal: true

module Mockolate::Initializers
  Mockolate::Register.set   :string,    Mockolate::Types::String
  Mockolate::Register.set   :integer,   Mockolate::Types::Integer
  Mockolate::Register.set   :hash,      Mockolate::Types::Hash
  Mockolate::Register.set   :array,     Mockolate::Types::Array
end