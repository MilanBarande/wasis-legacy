module ApplicationHelper
  def no_footer
    @hide_footer = true
  end

def render_stars(value)
  rating = ((value) / 0.5).floor / 2.0
  stars = ""
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
  output = "<span>" + stars + "</span>"
  output.html_safe
end
end
