# frozen_string_literal: true

require_relative 'config'

# Class to generate api connection with PokeApi
module PokeApi
  # Methods for all pokemons
  class Base
    include HTTParty

    base_uri 'https://pokeapi.co/api/v2'

    START_OFFSET = 0

    def initialize; end

    def get_limited_list(data: pokemon, limit: 20, offset: 0)
      list = self.class.get("/#{data}?limit=#{limit}}&#{offset}=0")
      list['results']
    end

    def get_by(**kwargs)
      return self.class.get("/#{kwargs[:pokedata]}/#{kwargs[:name]}") unless kwargs[:name].nil?
      return self.class.get("/#{kwargs[:pokedata]}/#{kwargs[:poke_id]}") unless kwargs[:poke_id].nil?

      p 'The right params were not provided'
    end

    def count_all(pokedata)
      query = self.class.get("/#{pokedata}")
      query['count']
    end

    def list_all(pokedata, total_count)
      list = []
      query = self.class.get("/#{pokedata}?limit=#{total_count}}&#{START_OFFSET}=0")
      results = query['results']
      results.each do |entry|
        poke_id = entry['url'][%r{/\d{1,}/}].sub(%r{/}, '').chomp('/')
        hash = { poke_id: poke_id, name: entry['name'], url: entry['url'] }
        list.append(hash)
      end
      list
    end
  end
end

# base = PokeApi::Base.new
# ability_data = base.get_by(pokedata: 'ability', name: 'battle-armor')
# p ability_data['effect_entries'][1]['effect']
# p ability_data['effect_entries'][1]['short_effect']