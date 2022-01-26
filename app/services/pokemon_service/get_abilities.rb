# frozen_string_literal: true

module PokemonService
  # class GetAbilities
  class GetAbilities
    def initialize; end

    def call
      connect = ConnectApi.new('ability', %w[name url])
      connect.call
    end
  end
end
