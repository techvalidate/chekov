class User < ActiveRecord::Base
  
  def self.authenticate(email)
    User.find_by_email email
  end
  
end
