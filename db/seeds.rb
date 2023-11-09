# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'net/http'
require 'json'

require 'net/http'
require 'json'

class PokemonDataLoader
  API_BASE_URL = 'https://pokeapi.co/api/v2/'

  def self.load_pokemon_data
    limit = 250
    pokemon_list_url = "#{API_BASE_URL}pokemon?limit=#{limit}"

    data = fetch_data_from_url(pokemon_list_url)
    return unless data

    total_pokemon = data['results'].size
    loaded_count = 0

    data['results'].each do |pokemon|
      pokemon_data = fetch_data_from_url(pokemon['url'])
      create_pokemon_from_data(pokemon_data)

      loaded_count += 1
      display_progress(loaded_count, total_pokemon)
    end
  rescue StandardError => e
    puts "Error occurred: #{e.message}"
  end

  def self.fetch_data_from_url(url)
    response = Net::HTTP.get(URI(url))
    JSON.parse(response) if response.present?
  end

  def self.create_pokemon_from_data(pokemon_data)
    return unless pokemon_data

    attributes = {
      name: pokemon_data['name'],
      order: pokemon_data['order'],
      base_experience: pokemon_data['base_experience'],
      height: pokemon_data['height'],
      weight: pokemon_data['weight'],
      types: pokemon_data['types'].map { |type| type['type']['name'] }
    }

    Pokemon.create(attributes)
  end

  def self.display_progress(loaded_count, total_pokemon)
    percent = ((loaded_count.to_f / total_pokemon) * 100).to_i
    puts "Loading: #{percent}% complete (#{loaded_count}/#{total_pokemon} Pokemon loaded)"
  end
end

PokemonDataLoader.load_pokemon_data