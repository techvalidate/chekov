class Story < ActiveRecord::Base
  
  belongs_to :context
  
  default_scope order('stories.description')
  
  validates_presence_of :description
  
end
