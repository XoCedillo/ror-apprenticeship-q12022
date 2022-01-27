# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def clean_tables
  Pokemon.destroy_all
  p 'pokemons table cleaned...'
  Ability.destroy_all
  p 'abilities table cleaned...'
  Type.destroy_all
  p 'types table cleaned...'
end

def fill_types
  types = PokemonService::GetTypes.new(fields: %w[name url]).call
  types.each do |t|
    type = Type.new
    type.poke_id = t[:poke_id]
    type.name = t[:name]
    type.url = t[:url]
    if type.save
      p "type: #{t[:name]}, has been added sucessfully"
    else
      p "type: #{t[:name]}, #{type.errors.messages}" # ---> iterar sobre las llaves de error
    end
  end
end

def fill_abilities
  abilities = PokemonService::GetAbilities.new(fields: %w[name url]).call
  abilities.each do |a|
    ability = Ability.new
    ability.poke_id = a[:poke_id]
    ability.name = a[:name]
    ability.url = a[:url]
    if ability.save
      p "ability: #{a[:name]}, has been added sucessfully"
    else
      p "ability: #{a[:name]}, #{ability.errors.messages}"  # ---> iterar sobre las llaves de error
    end
  end
end

def fill_pokemons
  fields = %w[name url sprites height weight abilities types]
  pokemons = PokemonService::GetPokemons.new(fields: fields).call(limit: 100)
  pokemons.each do |p|
    pokemon = Pokemon.new
    pokemon.poke_id = p[:poke_id]
    pokemon.name = p[:name]
    pokemon.url = p[:url]
    pokemon.sprite = p[:sprites]['front_default']
    pokemon.height = p[:height]
    pokemon.weight = p[:weight]
    fill_pokemon_abilities(pokemon, p[:abilities])
    fill_pokemon_types(pokemon, p[:types])
    if pokemon.save
      p "pokemon: #{p[:name]}, has been added sucessfully"
    else
      p "pokemon: #{p[:name]}, addition has failed"
    end
  end
end

def fill_pokemon_abilities(pokemon, pokemon_abilities)
  puts '---------------------------------'
  puts 'Filling pokemon abilities:'
  puts '---------------------------------'
  pokemon_abilities.each do |ability|
    ability_pokemon = Ability.find_by_name(ability['ability']['name'])
    pokemon.abilities << ability_pokemon
  end
end

def fill_pokemon_types(pokemon, pokemon_types)
  puts '---------------------------------'
  puts 'Filling pokemon types:'
  puts '---------------------------------'
  pokemon_types.each do |type|
    pokemon_type = Type.find_by_name(type['type']['name'])
    pokemon.types << pokemon_type
  end
end

# puts 'Calling seeds.rb....'
# puts '... Cleaning tables'
# clean_tables
# puts '---------------------------------'
# puts 'Populating the table abilities:'
# puts '---------------------------------'
# fill_abilities
# puts '---------------------------------'
# puts 'Populating the table types:'
# puts '---------------------------------'
# fill_types
puts '---------------------------------'
puts 'Populating the table pokemons:'
puts '---------------------------------'
fill_pokemons
