class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.string :name 
      t.string :description
      t.string :distance 
      t.integer :rating
      t.string :difficulty 
      t.string :tips
      t.integer :user_id
    end
end
