class User < ActiveRecord::Base
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
