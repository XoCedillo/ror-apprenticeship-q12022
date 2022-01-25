# frozen_string_literal: true

require_relative 'config'

# Class to generate api connection with PokeApi
module PokeApi
  # Methods for all abilities
  class Abilities < Base
    attr_accessor :all, :count

    def initialize
      super
      @count = count_all('ability')
      @all = list_all('ability')
    end

    def effect_of(poke_id:)
      ability_data = get_by(pokedata: 'ability', poke_id: poke_id)
      return if ability_data['effect_entries'].empty?

      ability_data['effect_entries'].each do |data|
        return data[:efect] if data.dig(:language, :name) == 'en'
      end
    end

    def short_effect_of(poke_id:)
      ability_data = get_by(pokedata: 'ability', poke_id: poke_id)
      return ability_data['effect_entries'][1]['short_effect'] unless ability_data['effect_entries'].empty?
    end

    def list_all(pokedata)
      list = []
      query = self.class.get("/#{pokedata}?limit=#{@count}}&#{START_OFFSET}=0")
      results = query['results']
      results.each do |entry|
        poke_id = entry['url'][%r{/\d{1,}/}].sub(%r{/}, '').chomp('/')
        # effect = effect_of(poke_id: poke_id)
        # short_effect = short_effect_of(poke_id: poke_id)
        # hash = { poke_id: poke_id, name: entry['name'], effect: effect, short_effect: short_effect, url: entry['url'] }
        hash = { poke_id: poke_id, name: entry['name'], url: entry['url'] }
        list.append(hash)
      end
      list
    end
  end
end

abilities = PokeApi::Abilities.new
# p abilities.effect_of(poke_id: '10002')
# p abilities.short_effect_of(poke_id: '10002')
p abilities.all
