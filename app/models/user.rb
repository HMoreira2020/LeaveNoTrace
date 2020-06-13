class User < ActiveRecord::Base 
    has_many :hikes
    has_secure_password

    def self.find_by_slug(slug)
        self.all.find {|obj| obj.slug == slug}
      end 
    
      def slug
        self.trailname.parameterize
      end 
end