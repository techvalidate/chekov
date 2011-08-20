class Story < ActiveRecord::Base
  
  belongs_to :context
  
  has_many :elements, :dependent=>:destroy
  has_many :suites,   :dependent=>:destroy
  
  accepts_nested_attributes_for :elements, reject_if: lambda {|e| e[:description].blank? }, allow_destroy: true
  
  default_scope order('stories.description')
  
  validates_presence_of :description
  
end
