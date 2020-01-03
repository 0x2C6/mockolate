# frozen_string_literal: true

class Mockolate::Types
  def self.inherited(base)
    base.extend TypeFactory
    base.extend TypeMetaData
  end
  
  module TypeFactory
    def create(name:, options: {})
      new(
        name:    name,
        options: options
      )
    end
  end

  module TypeMetaData
    def self.extended(base)
      base.class_eval do
        attr_reader   :name,  :options
        attr_accessor :children

        def initialize(name:, options: nil)
          @name     = name
          @options  = options
          @children = []
        end

        def parse
          raise "#{self.class}#parse is missing"
        end

        def has_children?
          !children.empty?
        end

        def value
          _get_value.public_send(_cast)
        end

        private
        def _get_value
          options[:value] || _get_from_faker!
        end

        def _cast
          class_name = self.class.name.split('::')

          return "to_#{class_name.last[0].downcase}".to_sym
        end

        def _get_from_faker!
          Object.const_get(
            "Faker::#{options[:fake_from]}"
          ).public_send(options[:key])
        end
        
      end
    end
  end

  require 'mockolate/types/string'
  require 'mockolate/types/integer'
  require 'mockolate/types/hash'
end