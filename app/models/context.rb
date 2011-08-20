class Context < ActiveRecord::Base
  
  belongs_to :release
  
  has_many :stories
  has_many :suites, :through=>:stories
  has_many :checks, :through=>:suites
  
  default_scope order('contexts.name')
  
  validates_presence_of :name, :release_id
  
end
