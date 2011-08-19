class User < ActiveRecord::Base
  
  def self.authenticate(email)
    User.find_by_email email
  end
  
  def name() "#{first_name} #{last_name}" end
  
end
