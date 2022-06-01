class AddNameToDonars < ActiveRecord::Migration[7.0]
  def change
    add_column :donars, :name, :string
    add_column :donars, :surname, :string
  end
end
