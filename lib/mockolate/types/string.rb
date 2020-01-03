# frozen_string_literal: true

class Mockolate::Types::String < Mockolate::Types
  # Public Methods
  # name:     Name of the key specified in params block
  # options:  Options of the key specified in params block
  # value:    Returns default value if specified, or fetchs data from faker

  def parse
    return name => value
  end
end