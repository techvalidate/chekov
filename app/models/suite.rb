class Suite < ActiveRecord::Base
  
  def self.locate(story, user)
    Suite.where(story_id: story, user_id: user).first || story.suites.build(user: user)
  end
  
  belongs_to :story
  belongs_to :user
  
  has_many :checks, :dependent=>:destroy
  
  accepts_nested_attributes_for :checks
  
end
