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


    if @review.save!
      if params[:review]["rating"] != ""
        rating = Rating.create(rating_params)
        rating.update(review: @review)
      end
      global_rating = 0
      @review.workplace.ratings.each do |rating|
        global_rating += (rating.wifi + rating.comfort + rating.service + rating.noise)
      end
      global_rating = global_rating.fdiv(@review.workplace.ratings.count * 4)
      @review.workplace.global_rating = global_rating.round(1)
      @review.workplace.save!
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


