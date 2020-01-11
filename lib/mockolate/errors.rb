# frozen_string_literal: true

module Mockolate::Errors
  class MockolateError        < StandardError;  end

  class FakerKeyNotFound      < MockolateError; end
  class TypeNotFound          < MockolateError; end
  class MissingHashBlockError < MockolateError; end
  class MissingValueError     < MockolateError; end
end