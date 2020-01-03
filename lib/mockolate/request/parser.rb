# frozen_string_literal: true

class Mockolate::Request::Parser
  attr_reader :_attr_arr
  
  def initialize(attr_arr)
    @_attr_arr = attr_arr
  end

  def parse
    #TODO: remove loop complexity
    _attr_arr.map do |attr|
      _hash = Hash.new
      
      attr.each do |t|
        _hash.merge! t.parse
      end  
      _hash
    end
  end

end
