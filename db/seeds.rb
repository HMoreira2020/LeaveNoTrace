
user1 = User.create(email: "moreheather@gmail.com", trailname: "Nobo", password: "hikeallday")
user2 = User.create(email: "at@gmail.com", trailname: "Sir Hikalot", password: "Ireallyhikealot")

hike1 = Hike.create(name: "West Fork Trail", location: "Sedona, AZ", difficulty: "Moderate", description: "A beautiful walk that crosses over Oak Creek Canyon several times", length: "2 miles", rating: 5, tips: "wear something you can get wet", features: ["water", "high cliffs", "green trees", "red rock"], user_id: 1)
hike2 = Hike.create(name: "Crescent Moon Ranch", location: "Sedona, AZ", difficulty: "Easy", description: "A beautiful walk by Oak Creek Canyon with views of Cathedral Rock", length: "3 miles", rating: 5, tips: "wear a swimsuit under clothes", features: ["water", "views", "swimming", "cathedral rock"], user_id: 2)

