# frozen_string_literal: true

module Mockolate::Validators
  class << self
    def check_value_given?(obj)
      return if _check_has_default_value?(obj) || _check_both_given?(obj)
      raise Mockolate::Errors::MissingValueError, 'Default value or all Faker options should be given'
    end

    def check_faker(obj)

    end

    private
    def _check_has_default_value?(obj)
      !!obj[:value]
    end

    def _check_has_faker_key?(obj)
      return !!obj[:key] 
    end

    def _check_has_faker_module?(obj)
      return !!obj[:fake_from]
    end

    def _check_both_given?(obj)
      _check_has_faker_key?(obj) &&  _check_has_faker_module?(obj)
    end
  end
end
