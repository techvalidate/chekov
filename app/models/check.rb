class Check < ActiveRecord::Base
  
  belongs_to :element
  belongs_to :suite
  
  scope :failed, where(passed: false)
  scope :passed, where(passed: true)
  
  scope :for_browser,  lambda{|browser| includes(:suite).where("suites.#{browser.to_sym}"=>true)}
  scope :for_element,  lambda{|element| where('element_id = ?', element.id)}
  
  scope :from_context, lambda{|context| includes(:suite=>{:story=>:context}).where('contexts.id = ?', context.id)}
  scope :from_release, lambda{|release| includes(:suite=>{:story=>:context}).where('contexts.release_id = ?', release.id)}
  scope :from_story,   lambda{|story|   includes(:suite=>:story).where('stories.id = ?', story.id)}
  scope :from_user,    lambda{|user|    includes(:suite).where('suites.user_id = ?', user.id) if user}
  
  validates_uniqueness_of :element_id, :scope=>:suite_id
  
end
