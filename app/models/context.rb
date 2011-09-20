class Context < ActiveRecord::Base
  
  belongs_to :release
  
  has_many :assignments, :dependent=>:destroy
  has_many :checks,      :through=>:suites
  has_many :stories,     :dependent=>:destroy
  has_many :suites,      :through=>:stories
  
  default_scope order('contexts.name')
  
  def passed_for(browser, user=nil)
    return 0 if stories.count.zero?
    (stories.to_a.sum{|s|s.passed_for browser, user} / stories.count.to_f).round
  end
  
  def passed_blended(user=nil)
    return 0 if browsers.count.zero?
    (browsers.sum{|b| passed_for b, user} / browsers.count.to_f).round
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
  
  def browsers
    Suite.browsers.select{|b| __send__ "#{b}?"}
  end
  
  validates_presence_of :name, :release_id
  
end
