class WorkplacesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  include ApplicationHelper

  def new
    @workplace = Workplace.new
    @features = Feature.all
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACE_API'])
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
    if params["features"]
      @feature_ids = []
      params["features"].each do |key, value|
        @feature_ids << value
      end
      @feature_ids.each do |feature_id|
        @workplaces = @workplaces.select { |w| w.features.include?(Feature.find(feature_id))}
      end
    end

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

    # to change
    @global_rating = Rating.all
    ###
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACE_API'])
    if @workplace.google_id.nil?
      google_places = @client.spots_by_query(@workplace.name)
      @workplace.google_id = google_places.first.place_id
    end

    @spot = @client.spot(@workplace.google_id)

    @visits = @workplace.visits.where(checkin: true)

    @workplace_coordinates = { lat: @workplace.latitude, lng: @workplace.longitude }
    @hash = Gmaps4rails.build_markers(@workplace) do |workplace, marker|
      marker.lat workplace.latitude
      marker.lng workplace.longitude
    end
    @reviews = Review.where(workplace_id: @workplace.id)
  end

  def edit
    set_workplace
    @features = Feature.all
    no_footer

  end

  def update
    set_workplace
    @workplacefeatures = Workplacefeature.where(workplace_id: @workplace.id)
    @workplace.address = params[:workplace][:address]
    @workplace.category = params[:workplace][:category]
    @workplace.photo = params[:workplace][:photo]
    @workplace.name = params[:workplace][:name]

    @workplacefeatures.destroy_all

    params[:workplace][:features].each do |id|
      if Feature.exists?(id.to_i)
        Workplacefeature.create!(workplace: @workplace, feature: Feature.find(id.to_i) )
      end
    end
    @workplace.save
    redirect_to workplace_path(@workplace)

  end

  def destroy
  end

  private

  def set_workplace
    @workplace = Workplace.find(params[:id])
  end

  def workplace_params
    params.require(:workplace).permit(:name, :google_id, :category, :address, :longitude, :latitude, :photo, :photo_cache)
  end
end
