module ApplicationHelper
  def no_footer
    @hide_footer = true
  end

  def render_stars(value)

    stars = ""
    if value == [] || value.nil?
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
    running_total = 0.0
    @workplace.ratings.each do |rating|
      # the `send` method allows to dynamically pass methods to an object
        unless rating.send(feature).nil?
          running_total += rating.send(feature)
        end
    end

    if running_total == 0.0
      rating_float = 0.0
    else
      rating_float = (running_total / number_of_reviews_for_workplace.to_f).round(2)
    end

      # ((rating_float) / 0.5).floor / 2.0
  end
end

