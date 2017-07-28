module ApplicationHelper
  def no_footer
    @hide_footer = true
  end

  def render_stars(value)
    stars = ""
    if value.nil?
      5.times do
        stars << "<i class=\"fa fa-star-o\"></i>"
      end
    else
      rating = ((value) / 0.5).floor / 2.0
      5.times do
        if rating > 0.5
          stars << "<i class=\"fa fa-star\"></i>"
        elsif rating > 0
          stars << "<i class=\"fa fa-star-half-o\"></i>"
        else
          stars << "<i class=\"fa fa-star-o\"></i>"
        end
        rating -= 1
      end
    end
    output = "<span>" + stars + "</span>"
    output.html_safe

  end

  def average_feature_rating(feature)
    @workplace = Workplace.find(params[:id])
    feature = feature.to_sym
    number_of_reviews_for_workplace = @workplace.reviews.count
    if @workplace.reviews.count == 0
      return 0.to_f
    else
      running_total = 0.0
      @workplace.ratings.each do |review|
        # the `send` method allows to dynamically pass methods to an object
        running_total += review.send(feature)
        end
      rating_float = running_total / number_of_reviews_for_workplace
    ((rating_float) / 0.5).floor / 2.0
    end
  end
end


