# frozen_string_literal: true

require_relative 'config'

# Class to generate api connection with PokeApi
module PokeApi
  # Methods for all pokemons
  class Pokemons < Base
    attr_accessor :all, :count

    def initialize
      super
      @count = count_all('pokemon')
      @all = list_all('pokemon')
    end

    def list_all(pokedata)
      list = []
      query = self.class.get("/#{pokedata}?limit=#{@count}}&#{START_OFFSET}=0")
      results = query['results']
      results.each do |entry|
        poke_id = entry['url'][%r{/\d{1,}/}].sub(%r{/}, '').chomp('/')
        sprite_url = get_by(pokedata: 'pokemon', poke_id: poke_id)['sprites']['front_default']
        p hash = { poke_id: poke_id, name: entry['name'], url: entry['url'], sprite: sprite_url }
        list.append(hash)
      end
      list
    end
  end
end

# pokemons = PokeApi::Pokemons.new
# pokemons.all[0]
