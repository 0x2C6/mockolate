# frozen_string_literal: true

require "mockolate/parameters/generator"
require "mockolate/parameters/attributes"

class Mockolate::Parameters
  include Mockolate::Parameters::Generator
  include Mockolate::Parameters::Attributes
end