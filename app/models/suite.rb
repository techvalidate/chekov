class Suite < ActiveRecord::Base
  
  def self.browsers
    [:ie8, :ie9, :ie10, :ff, :chrome]
  end
  
  def self.locate(story, user, browser)
    Suite.where(story_id: story, user_id: user).for_browser(browser).first || story.suites.build(user: user, browser: browser)
  end
  
  belongs_to :story
  belongs_to :user
  
  has_many :checks, :dependent=>:destroy
  
  accepts_nested_attributes_for :checks
  
  scope :for_browser, lambda{ |brwsr| brwsr.nil? ? where('') : where(brwsr.to_sym=>true) }
  scope :for_story,   lambda{ |story| where('story_id = ?', story.id)}
  
  scope :from_user,   lambda{ |usr| usr.nil? ? where('') : where(user_id: usr.id)}
  
  def browser
    Suite.browsers.each{|b| return b if __send__("#{b}?")}
  end

  def browser=(sym)
    Suite.browsers.each{|b| __send__ "#{b}=", false}
    __send__ "#{sym}=", true
  end
  
  validates_presence_of   :story_id, :user_id
  
end
