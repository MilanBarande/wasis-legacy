class WorkplacesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @workplace = Workplace.new
  end

  def create
    @workplace = Workplace.new(workplace_params)
  end

  def index
    @workplaces = Workplace.all
  end

  def show
    @workplace = Workplace.find(params[:id])
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
