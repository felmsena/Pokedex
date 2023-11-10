# spec/integration/api/v1/pokemons_spec.rb

require 'swagger_helper'

describe 'Pokemons API' do
  path '/api/v1/pokemons' do
    get 'Retrieves a list of pokemons' do
      tags 'Pokemons'
      produces 'application/json'

      response '200', 'pokemons found' do
        run_test!
      end
    end

    post 'Creates a pokemon' do
      tags 'Pokemons'
      consumes 'application/json'
      parameter name: :pokemon, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          order: { type: :integer },
          base_experience: { type: :integer },
          height: { type: :integer },
          weight: { type: :integer },
          types: { type: :array, items: { type: :string } }
        },
        required: ['name', 'order', 'base_experience', 'height', 'weight']
      }

      response '201', 'pokemon created' do
        run_test!
      end
    end
  end

  path '/api/v1/pokemons/{id}' do
    parameter name: :id, in: :path, type: :string

    get 'Retrieves a pokemon' do
      tags 'Pokemons'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'pokemon found' do
        run_test!
      end

      response '404', 'Pokemon not found' do
        run_test!
      end
    end

    put 'Updates a pokemon' do
      tags 'Pokemons'
      consumes 'application/json'
      parameter name: :pokemon, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          order: { type: :integer },
          base_experience: { type: :integer },
          height: { type: :integer },
          weight: { type: :integer },
          types: { type: :array, items: { type: :string } }
        },
        required: ['name', 'order', 'base_experience', 'height', 'weight']
      }

      response '200', 'pokemon updated' do
        run_test!
      end

      response '404', 'Pokemon not found' do
        run_test!
      end
    end

    delete 'Deletes a pokemon' do
      tags 'Pokemons'
      produces 'application/json'

      response '200', 'pokemon deleted' do
        run_test!
      end

      response '404', 'Pokemon not found' do
        run_test!
      end
    end
  end
end
