


Hike.create(name: "West Fork Trail", description: "A beautiful walk that crosses over Oak Creek Canyon several times", length: "2 miles", rating: 5, tips: "wear something you can get wet", features: ["water", "high cliffs", "green trees", "red rock"], user_id: 1)
Hike.create(name: "Crescent Moon Ranch", description: "A beautiful walk by Oak Creek Canyon with views of Cathedral Rock", length: "3 miles", rating: 5, tips: "wear a swimsuit under clothes", features: ["water", "views", "swimming", "cathedral rock"], user_id: 2)
t.string :description
t.string :difficulty
t.string :length 
t.integer :rating 
t.string :tips
t.string :features
t.integer :user_id