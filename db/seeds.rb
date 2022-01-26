# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Pokemon.destroy_all
p 'pokemons table cleaned'
Ability.destroy_all
p 'abilities table cleaned'
Type.destroy_all
p 'types table cleaned'


def fill_types
  types = PokemonService::GetTypes.new(fields: %w[name url]).call
  types.each do |t|
    type = Type.new
    type.poke_id = t[:poke_id]
    type.name = t[:name]
    type.name = t[:url]
    if type.save
      p "type: #{a[:name]}, has been added sucessfully"
    else
      p "type: #{a[:name]}, #{type.errors.messages}" # ---> iterar sobre las llaves de error
    end
  end
end

def fill_abilities
  abilities = PokemonService::GetAbilities.new(fields: %w[name url]).call
  abilities.each do |a|
    ability = Ability.new
    ability.poke_id = a[:poke_id]
    ability.name = a[:name]
    ability.name = a[:url]
    if ability.save
      p "ability: #{a[:name]}, has been added sucessfully"
    else
      p "ability: #{a[:name]}, #{ability.errors.messages}"  # ---> iterar sobre las llaves de error
    end
  end
end

def fiil_pokemons
  pokemons = PokemonService::GetPokemons.new('pokemons').call
  pokemons.each do |p|
    pokemon = Pokemon.new 
    pokemon.name = p[:name]
    ...
    if pokemon.save
      p "pokemon: #{p[:name]}, has been added sucessfully"
    else
      p "pokemon: #{p[:name]}, addition has failed"
    end
  end
end


