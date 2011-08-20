class Check < ActiveRecord::Base
  
  belongs_to :element
  belongs_to :suite
  
  scope :failed, where(passed: false)
  scope :passed, where(passed: true)
  
  scope :from_context, lambda{|context| includes(:suite=>{:story=>:context}).where('contexts.id = ?', context.id)}
  scope :from_release, lambda{|release| includes(:suite=>{:story=>:context}).where('contexts.release_id = ?', release.id)}
  scope :from_story,   lambda{|story|   includes(:suite=>:story).where('stories.id = ?', story.id)}
  
end
