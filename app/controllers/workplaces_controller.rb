class WorkplacesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @workplace = Workplace.new
  end

  def create
    @workplace = Workplace.new(workplace_params)
  end

  def index
    @features = Feature.all
    @workplaces = Workplace.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@workplaces) do |workplace, marker|
      marker.lat workplace.latitude
      marker.lng workplace.longitude
      marker.picture({
        url: ActionController::Base.helpers.asset_path("icone_#{workplace.category}.png"),
        width:  45,
        height: 55
      })
      marker.title "<a href=" + workplace_url(workplace) + ">" + workplace.name + "</a>"
    end
  end

  def show
    @workplace = Workplace.find(params[:id])
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACE_API'])
    @spot = @client.spot(@workplace.google_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_workplace
    @workplace = Workplace.find(params[:id])
  end

  def workplace_params
    params.require(:workplace).permit(:name, :google_id, :category, :address, :longitude, :latitude)
  end
end
