class Element < ActiveRecord::Base
  acts_as_list
  
  belongs_to :story
  
  has_many :checks, :dependent=>:destroy
  
  default_scope order('elements.position')
  
  validates_presence_of :description
  
end
