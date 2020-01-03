# frozen_string_literal: true

module Mockolate::Errors
  class MockolateError   < StandardError;  end

  class FakerKeyNotFound < MockolateError; end
  class TypeNotFound     < MockolateError; end
end