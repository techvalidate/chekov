class Suite < ActiveRecord::Base
  
  def self.locate(story, user)
    Suite.where(story_id: story, user_id: user).first || story.suites.build(user: user)
  end
  
  belongs_to :story
  belongs_to :user
  
  has_many :checks, :dependent=>:destroy
  
  accepts_nested_attributes_for :checks
  
  validates_presence_of   :story_id, :user_id
  validates_uniqueness_of :story_id, :scope=>:user_id
  
end