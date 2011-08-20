class Context < ActiveRecord::Base
  
  belongs_to :release
  
  has_many :stories
  
  default_scope order('contexts.name')
  
  validates_presence_of :name, :release_id
  
end
