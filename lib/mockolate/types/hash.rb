# frozen_string_literal: true

class Mockolate::Types::Hash < Mockolate::Types
  # Public Methods
  # name:            Name of the key specified in params block
  # has_children:    Returns children elements of hash

  def parse
    return name => {}.merge(*_parse_child)
  end

  private
  def _parse_child
    children.flatten.map do |child|
      child.parse
    end
  end
end
