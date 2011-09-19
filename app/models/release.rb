class Release < ActiveRecord::Base
  
  def self.current
    Release.where(current: true).first
  end

  has_many :contexts, :dependent=>:destroy
  has_many :stories,  :through=>:contexts
  has_many :suites,   :through=>:stories
  
  def passed_for(browser, user=nil)
    return 0 if contexts.count.zero?
    (stories.to_a.sum{|s|s.passed_for browser, user} / stories.count.to_f).round
  end
  
  def passed_blended(user=nil)
    total = 0
    Suite.browsers.each do |browser|
      total = total + passed_for(browser, user)
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
  
  validates_presence_of :name
  
end
