# frozen_string_literal: true

require_relative 'poke_api'

# Class to generate api connection with PokeApi
module PokeApi
  # Methods for all pokemons
  class Type < PokeApi
    def initialize
      super
      @count = count_all('type')
      @all = list_all('type', @count)
    end
  end
end

# poketypes = PokeApi::Type.new
