class UserAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :user_account do |user_account|
      t.string :name
    end
  end
end
