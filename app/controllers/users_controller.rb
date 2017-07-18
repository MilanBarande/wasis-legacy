class UsersController < ApplicationController
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
    set_user
    # TODO
  end

  def show
    set_user
    @review = Review.new
    @favorites = Favorite.where(user_id: @user.id)
    @workplaces = Workplace.where(user_id: @user.id)
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
