class User < ActiveRecord::Base 
    has_many :hikes
    has_secure_password

    validates :email, :presence =>true,  :uniqueness => {case_sensitive: false}, :format => { :with=> /([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/, :message => "please enter a valid e-mail" }
    validates :trailname, :presence => true 
    validates :email, :uniqueness => true 
    validates :trailname, :uniqueness => true 


    def self.find_by_slug(slug)
        self.all.find {|obj| obj.slug == slug}
      end 
    
      def slug
        self.trailname.parameterize
      end 
end