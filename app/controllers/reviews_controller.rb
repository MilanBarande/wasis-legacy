class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @workplace = Workplace.find(params[:workplace_id])
    @user_ratings = []
    Rating::DESCRIPTIONS.each do |description|
      @user_ratings << Rating.new(description: description)
    end
  end

  def create
    @review = Review.new(review_params)
    @review.workplace = Workplace.find(params[:workplace_id])
    @review.user = User.find(current_user.id)
    # Save ratings
    if @review.save!
      params["ratings"].each do |rating|
        if rating["rate"] != ""
          Rating.create(rating_params(rating))
        end
      end
      redirect_to workplace_path(@review.workplace)
    else
      render :new
    end
  end

  def destroy

  end

  def review_params
    params.require(:review).permit(:comment)
  end

  def rating_params(my_params)
    my_params.permit(:rating)
  end

end


