# frozen_string_literal: true

module PokemonService
  # class GetTypes
  class GetTypes
    def initialize; end

    def call
      connect = ConnectApi.new('type', %w[name url])
      connect.call
    end
  end
end
