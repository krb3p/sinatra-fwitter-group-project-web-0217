class User < ActiveRecord::Base
  has_many :tweets
  
  include Slugify
  extend SelfSlug

  def authenticate(password)
    if self.password == password
      self
    else
      false
    end
  end


end
