# frozen_string_literal: true

require_relative 'config'

# Class to generate api connection with PokeApi
module PokeApi
  # Methods for all pokemons
  class Poketype < Base
    def initialize
      super
      p @count = count_all('type')
      p @all = list_all('type', @count)
    end
  end
end

# poketypes = PokeApi::Poketype.new
