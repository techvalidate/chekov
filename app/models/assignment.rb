class Assignment < ActiveRecord::Base
  
  def self.toggle!(user, context, browser)
    assignment = user.assignments.find_or_create_by_context_id context.id
    assignment.toggle! browser.to_sym
  end
  
  belongs_to :context
  belongs_to :user
  
  scope :for_browser, ->(browser) { where("#{browser.to_sym}"=>true) }
  scope :for_context, ->(context) { where(context_id: context.id)    }
  
end
