class RemoveDescriptionAndRatingFromRatings < ActiveRecord::Migration[5.0]
  def change
    remove_column :ratings, :description
    remove_column :ratings, :rating
  end
end
