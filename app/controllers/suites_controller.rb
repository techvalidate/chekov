class SuitesController < ApplicationController
  before_filter :find_current_release
  before_filter :find_context
  before_filter :find_story
  
  # GET /contexts/:context_id/stories/:story_id/suites/new
  def new
    @suite = @story.suites.build
  end
  
  protected
  def find_story
    @story = @context.stories.find params[:story_id]
  end
  
end
