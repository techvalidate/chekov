class User < ActiveRecord::Base
  
  def self.authenticate(email)
    User.find_by_email email
  end
  
  has_many :checks, :through=>:suites
  has_many :suites, :dependent=>:destroy
  
  def name() "#{first_name} #{last_name}" end
    
  validate :email, :presence=>true, :uniqueness=>true
  
end
