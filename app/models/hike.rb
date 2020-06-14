class Hike < ActiveRecord::Base 
    belongs_to :user 

    validates :name, :presence =>true
    validates :location, :presence => true 
    validates :description, :presence => true 
    validates :difficulty, :presence => true 
    validates :rating, :presence =>true  
    validates :features, :presence => true 
    validates :length, :presence => true 
    validates :tips, :presence  => true 
end