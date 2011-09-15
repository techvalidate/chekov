class Element < ActiveRecord::Base
    
  belongs_to :story
  
  has_many :checks, :dependent=>:destroy
  
  after_create :propagate_checks
  def propagate_checks
    story.suites.each do |suite|
      check = suite.checks.build element: self
      check.save
    end
  end
  
  validates_presence_of :description
  
end
