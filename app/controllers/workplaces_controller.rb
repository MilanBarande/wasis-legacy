class WorkplacesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  include ApplicationHelper

  def new
    @workplace = Workplace.new
    @features = Feature.all
    no_footer
  end

  def create
    @workplace = Workplace.create(workplace_params)
    params[:workplace][:features].each do |id|
      if Feature.exists?(id.to_i)
        Workplacefeature.create!(workplace: @workplace, feature: Feature.find(id.to_i) )
      end
    end
    if @workplace.save
      redirect_to workplaces_path
    else
      render :new
    end
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
        height: 57
      })
      marker.title workplace.id.to_s
    end
    no_footer
  end

  def show
    @workplace = Workplace.find(params[:id])
    @review = Review.new
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACE_API'])
    @spot = @client.spot(@workplace.google_id)
    @visits = @workplace.visits.where(checkin: true)

    @workplace_coordinates = { lat: @workplace.latitude, lng: @workplace.longitude }
    @hash = Gmaps4rails.build_markers(@workplace) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end

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
    params.require(:workplace).permit(:name, :google_id, :category, :address, :longitude, :latitude, :photo, :photo_cache, :features)
  end
end
