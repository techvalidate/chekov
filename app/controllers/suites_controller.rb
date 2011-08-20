class SuitesController < ApplicationController
  before_filter :find_current_release
  before_filter :find_context
  before_filter :find_story
  
  # GET /contexts/:context_id/stories/:story_id/suites/new
  def new
    @suite = Suite.locate @story, current_user
    redirect_to [@context, @story, @suite] and return unless @suite.new_record?
  end
  
  # POST /contexts/:context_id/stories/:story_id/suites
  def create
    @suite = @story.suites.build params[:suite]
    @suite.user = current_user
    @suite.save!
    redirect_to @context
  end
  
  protected
  def find_story
    @story = @context.stories.find params[:story_id]
  end
  
end
