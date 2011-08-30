class Story < ActiveRecord::Base
  
  belongs_to :context
  
  has_many :checks,   :through=>:suites
  has_many :elements, :dependent=>:destroy
  has_many :suites,   :dependent=>:destroy
  
  accepts_nested_attributes_for :elements, reject_if: lambda {|e| e[:description].blank? }, allow_destroy: true
  
  default_scope order('stories.description')
  
  def passed_for(browser)
    return 0 if checks.for_browser(browser).count.zero?
    (checks.for_browser(browser).passed.count / checks.for_browser(browser).count.to_f * 100).round
  end
  
  def passed_blended
    return 0 if context.browsers.count.zero?
    (context.browsers.sum{|b| passed_for b} / context.browsers.count.to_f).round
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
  
  validates_presence_of :name, :context_id
  
end
