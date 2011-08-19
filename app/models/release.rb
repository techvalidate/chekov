class Release < ActiveRecord::Base
  
  def self.current
    Release.where(current: true).first
  end

  has_many :contexts, :dependent=>:destroy
  
  validates_presence_of :name
  
end
