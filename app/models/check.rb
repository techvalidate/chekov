class Check < ActiveRecord::Base
  
  belongs_to :element
  belongs_to :suite, touch: true
  
  scope :failed, -> { where(passed: false) }
  scope :passed, -> { where(passed: true)  }
  
  scope :for_browser,  ->(browser) { includes(:suite).where("suites.#{browser.to_sym}"=>true)}
  scope :for_element,  ->(element) { where('element_id = ?', element.id)}
  
  scope :from_context, ->(context){ includes(:suite=>{:story=>:context}).where('contexts.id = ?', context.id)}
  scope :from_release, ->(release){ includes(:suite=>{:story=>:context}).where('contexts.release_id = ?', release.id)}
  scope :from_story,   ->(story)  { includes(:suite=>:story).where('stories.id = ?', story.id)}
  scope :from_user,    ->(user)   { includes(:suite).where('suites.user_id = ?', user.id) if user}
  
  validates_uniqueness_of :element_id, :scope=>:suite_id
  
end
