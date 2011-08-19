class Release < ActiveRecord::Base
  
  def self.current
    Release.where(current: true).first
  end
  
  validates_presence_of :name
  
end
