require 'csv'
class Release < ActiveRecord::Base
  
  def self.current
    Release.where(current: true).first
  end

  has_many :contexts, :dependent=>:destroy
  has_many :stories,  :through=>:contexts
  has_many :suites,   :through=>:stories

  def list_csv
    CSV.generate do |csv|
      contexts.each do |context|
        csv << [context.name, nil, nil]
        context.stories.each do |story|
          csv << [nil, story.name, nil]
          story.elements.each do |element|
            csv << [nil, nil, element.description]
          end
        end
      end
    end
  end
  
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
  
  def import_contexts_from(previous)
    previous.contexts.each do |context|
      context.copy_into self
    end
  end
  
  validates_presence_of :name
  
end