class AddEmailToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :email, :string
  end
end
