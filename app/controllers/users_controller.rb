class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]

  def new
    @user = User.new
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to products_path
  #   else
  #     render :new
  #   end
  # end

  def edit

    # TODO
  end

  def show
    @review = Review.new
    @favourites = @user.favourites
    @workplaces = @user.workplaces.distinct
    @visits = @user.visits

  end

  def index
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :bio, :address, :city, :photo)
  end

end
