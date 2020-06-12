class AddLocationToHikes < ActiveRecord::Migration
  def change
    add_column :hikes, :location, :string
  end
end
