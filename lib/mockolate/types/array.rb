# frozen_string_literal: true

class Mockolate::Types::Array < Mockolate::Types
  # Public Methods
  # name:            Name of the key specified in params block
  # has_children:    Returns children elements of hash
  #
  # Private Methods
  # _parse_child    Returns array with parsed children

  def parse
    return name => [].push(*_parse_child)
  end
end
