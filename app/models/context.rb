class Context < ActiveRecord::Base
  
  belongs_to :release
  
  default_scope order('contexts.name')
  
  validates_presence_of :name
  
end
