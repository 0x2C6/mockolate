# frozen_string_literal: true

class Mockolate::Request::Parser
  attr_reader :_attr_arr
  attr_reader :_export_key
  
  def initialize(attr_arr, options = {})
    @_attr_arr = attr_arr
    @_export_key  = options[:export_with]
  end

  def parse
    return _parse_to_hash if _export_key
    _parse_to_array
  end

  private
  def _parse_to_hash
    export_hash = {}
    _attr_arr.each do |attr|
      hash = {}
      attr.each do |t|
        hash.merge! t.parse
      end  
      export_hash[hash[_export_key]] = hash
    end
    return export_hash
  end

  def _parse_to_array
    _attr_arr.map do |attr|
      _hash = Hash.new
      
      attr.each do |t|
        _hash.merge! t.parse
      end  
      _hash
    end
  end

end
