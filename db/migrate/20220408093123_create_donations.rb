class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.string :name
      t.string :blood_group
      t.date :dob
      t.string :gender
      t.string :email
      t.string :contact
      t.string :city
      t.string :last_donate

      t.timestamps
    end
  end
end
