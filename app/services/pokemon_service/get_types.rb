# frozen_string_literal: true

module PokemonService
  # class GetTypes
  class GetTypes
    attr_reader :fields

    def initialize(fields:)
      p 'get_types service has been initialized'
      @fields = fields
    end

    def call(**kwargs)
      p 'conection with API...'
      connect = ConnectApi.new('type', @fields)
      kwargs[:limit].nil? ? connect.call(connect.count) : connect.call(kwargs[:limit])
    end
  end
end
