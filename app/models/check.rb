class Check < ActiveRecord::Base
  
  belongs_to :element
  belongs_to :suite
  
  scope :failed, where(passed: false)
  scope :passed, where(passed: true)
  
end
