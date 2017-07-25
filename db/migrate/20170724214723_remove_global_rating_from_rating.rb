class RemoveGlobalRatingFromRating < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :global_rating
    add_column :workplaces, :global_rating, :float
  end
end
