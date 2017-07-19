class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @workplace = Workplace.find(params[:workplace_id])
    @rating = Rating.new
  end

  def create
    @review = Review.new(review_params)
    @review.workplace = Workplace.find(params[:workplace_id])
    @review.user = User.find(current_user.id)
    # Save ratings
    if @review.save!
      params[:review]["rating"].each do |rating|
        if params[:review]["rating"] != ""
          Rating.create(rating_params)
        end
      end
      redirect_to workplace_path(@review.workplace)
    else
      render :new
    end
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:comment, :ratings_attributes => [:rating])
  end

  def rating_params
    params.require(:review).require(:rating).permit(:wifi, :noise, :comfort, :service)
  end

end


