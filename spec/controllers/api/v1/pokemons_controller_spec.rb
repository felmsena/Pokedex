# spec/controllers/api/v1/pokemons_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { pokemon: { name: 'Pikachu', order: 25, base_experience: 112, height: 4, weight: 60, types: ['electric'] } } }

    context 'with valid params' do
      it 'creates a new pokemon' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe 'GET #show' do
    context 'when the pokemon exists' do
      let!(:pokemon) { create(:pokemon) }

      it 'returns a successful response' do
        get :show, params: { id: pokemon.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the pokemon does not exist' do
      it 'returns a not found response' do
        get :show, params: { id: 'invalid_id' }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PUT #update' do
    context 'when the pokemon exists' do
      let!(:pokemon) { create(:pokemon) }
      let(:update_params) { { name: 'Pikachu Updated' } }

      it 'updates the pokemon' do
        put :update, params: { id: pokemon.id, pokemon: update_params }
        expect(response).to have_http_status(:ok)
        expect(Pokemon.find(pokemon.id).name).to eq('Pikachu Updated')
      end
    end

    context 'when the pokemon does not exist' do
      it 'returns a not found response' do
        put :update, params: { id: 'invalid_id', pokemon: { name: 'Pikachu Updated' } }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the pokemon exists' do
      let!(:pokemon) { create(:pokemon) }

      it 'deletes the pokemon' do
        delete :destroy, params: { id: pokemon.id }
        expect(response).to have_http_status(:ok)
        expect(Pokemon.find_by(id: pokemon.id)).to be_nil
      end
    end

    context 'when the pokemon does not exist' do
      it 'returns a not found response' do
        delete :destroy, params: { id: 'invalid_id' }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
