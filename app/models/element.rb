class Element < ActiveRecord::Base
    
  belongs_to :story
  
  has_many :checks, :dependent=>:destroy
    
  validates_presence_of :description
  
end
