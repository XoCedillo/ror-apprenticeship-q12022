# frozen_string_literal: true

module PokemonService
  # class GetPokemons
  class GetPokemons
    def initialize; end

    def call
      connect = ConnectApi.new('pokemon', %w[name url height weight])
      connect.call
    end
  end
end
