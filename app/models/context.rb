class Context < ActiveRecord::Base

  belongs_to :release, touch: true

  has_many :assignments, :dependent=>:destroy
  has_many :checks,      :through=>:suites
  has_many :stories,     :dependent=>:destroy
  has_many :suites,      :through=>:stories

  scope :abc, -> { order('contexts.name') }

  def passed_for(browser, user=nil)
    return 0 if stories.count.zero?
    (stories.to_a.sum{|s|s.passed_for browser, user} / stories.count.to_f).round
  end

  def passed_blended(user=nil)
    return 0 if browsers.count.zero?
    (browsers.sum{|b| passed_for b, user} / browsers.count.to_f).round
  end

  def browsers
    Suite.browsers.select{|b| __send__ "#{b}?"}
  end

  def copy_into(release)
    context = release.contexts.build name: name, ie8: ie8?, ie9: ie9?, ie10: ie10?, ff: ff?, chrome: chrome?, safari: safari?, description: description
    context.save!
    stories.each do |s|
      story = context.stories.build name: s.name, description: s.description
      story.save!
      s.elements.each do |e|
        element = story.elements.build description: e.description
        element.save!
      end
    end
    context
  end

  validates_presence_of :name, :release_id

end
