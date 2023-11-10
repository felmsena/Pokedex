class Api::V1::PokemonsController < ApplicationController
  def index
    pokemons = Pokemon.all
    render json: pokemons, status: :ok
  end

  def show
    pokemon = Pokemon.find_by(id: params[:id])
    if pokemon
      render json: pokemon.as_json, status: :ok
    else
      render json: {errors: ["Pokemon not found"]}, status: :not_found
    end
  end

  def create
    pokemon = Pokemon.new(pokemon_params)
    if pokemon.save
      render json: pokemon.as_json, status: :created
    else
      render json: {errors: pokemon.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    pokemon = Pokemon.find_by(id: params[:id])
    if pokemon
      pokemon.update(pokemon_params)
      render json: pokemon.as_json, status: :ok
    else
      render json: {errors: ["Pokemon not found"]}, status: :not_found
    end
  end

  def destroy
    pokemon = Pokemon.find_by(id: params[:id])
    if pokemon
      pokemon.destroy
      render json: {success: ["Pokemon deleted"]}, status: :ok
    else
      render json: {errors: ["Pokemon not found"]}, status: :not_found
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :order, :base_experience, :height, :weight, types: [])
  end
end