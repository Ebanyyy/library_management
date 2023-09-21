class RenameColumnScoreFromReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :score, :rating
  end
end
