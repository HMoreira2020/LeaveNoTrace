class AddColumnToHikes < ActiveRecord::Migration
  def change
    add_column :hikes, :name, :string
  end
end
