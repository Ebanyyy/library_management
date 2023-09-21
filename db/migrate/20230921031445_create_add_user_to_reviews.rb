class CreateAddUserToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :user_id, :integer
    remove_column :reviews, :name
  end
end
