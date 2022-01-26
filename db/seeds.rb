# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

type_records = PokeApi::Type.new

ability_records = PokeApi::Ability.new


p type_records
p ability_records

# pokemon_records = PokeApi::Pokemon.new

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


pokemons = PokemonService::GetPokemons.new('pokemons').call
pokemons.each do |p|
  pokemon = Pokemon.new 
  pokemon.name = p[:name]
  ...
  if pokemon.save
    p "pokemon: #{p[:name]}, has been added sucessfully"
  else
    p "pokemon: #{p[:name]}, #{pokemon.errors.messages}"  # ---> iterar sobre las llaves de error
  end
end