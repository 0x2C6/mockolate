# frozen_string_literal: true

require "mockolate/parameters/generator"
require "mockolate/parameters/attributes"
require "mockolate/parameters/hooks"

class Mockolate::Parameters
  include Mockolate::Parameters::Generator
  include Mockolate::Parameters::Attributes
  include Mockolate::Parameters::Hooks
  
  def self.inherited(base)
    initialize!(base)
  end
end