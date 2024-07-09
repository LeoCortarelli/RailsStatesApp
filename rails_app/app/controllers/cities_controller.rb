class CitiesController < ApplicationController
    def index
      @cities = City.all
      @cities = @cities.where(state_id: params[:state_id]) if params[:state_id].present?
      @cities = @cities.where('name ILIKE ?', "%#{params[:name]}%") if params[:name].present?
      render json: @cities
    end
  end
  