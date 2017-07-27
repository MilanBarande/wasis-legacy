class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

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
    @user = User.find(params[:id])
    # TODO
  end

  def show
    @reviews = Review.where(user_id: @user.id)
    @workplaces = @user.workplaces.distinct
    @visits = @user.visits
    @favourites = Favourite.where(user_id: @user.id)
  end

  def index

  end

  def update
    if params[:nav] == "true"
      @user.status = params[:status]
    else
      @user.status = (params[:user][:status])
    end

    if @user.save
      respond_to do |format|
        format.html { redirect_to workplace_path(params[:user][:workplace])}
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to workplace_path(params[:user][:workplace])}
        format.js  # <-- idem
      end
    end
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :bio, :address, :city, :photo, :status)
  end

end
