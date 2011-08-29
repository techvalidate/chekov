class Context < ActiveRecord::Base
  
  belongs_to :release
  
  has_many :stories
  has_many :suites, :through=>:stories
  has_many :checks, :through=>:suites
  
  default_scope order('contexts.name')
  
  def passed_for(browser)
    return 0 if stories.count.zero?
    (stories.to_a.sum{|s|s.passed_for browser} / stories.count.to_f).round
  end
  
  def passed_blended
    total = 0
    Suite.browsers.each do |browser|
      total = total + passed_for(browser)
    end
    (total / Suite.browsers.count.to_f).round
  end
  
  def coverage(browser=nil)
    case suites.for_browser(browser).collect(&:user).uniq.count # SQL?
    when 0
      'coverage_empty'
    when 1
      'coverage_half'
    else
      'coverage_full'
    end
  end
  
  validates_presence_of :name, :release_id
  
end
