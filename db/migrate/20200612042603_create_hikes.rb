class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t| 
      t.string :description
      t.string :difficulty
      t.string :length 
      t.integer :rating 
      t.string :tips
      t.string :features
      t.integer :user_id
    end
  end
end
