json.extract! pokemon, :id, :poke_id, :name, :url, :sprite, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
