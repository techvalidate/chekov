class SuitesController < ApplicationController
  before_filter :find_current_release
  before_filter :find_context
  before_filter :find_story
  
  # GET /contexts/:context_id/stories/:story_id/suites/:id
  def show
    @suite = @story.suites.find params[:id]
  end
  
  # GET /contexts/:context_id/stories/:story_id/suites/new
  def new
    @suite = Suite.locate @story, current_user
    redirect_to [@context, @story, @suite] and return unless @suite.new_record?
    @story.elements.each{ |e| @suite.checks.build element: e}
  end
  
  # POST /contexts/:context_id/stories/:story_id/suites
  def create
    @suite = @story.suites.build params[:suite]
    @suite.user = current_user
    @suite.save!
    redirect_to @context
  end
  
  # PUT /contexts/:context_id/stories/:story_id/suites/:id
  def update
    @suite = @story.suites.find params[:id]
    @suite.update_attributes params[:suite]
    redirect_to @context
  end
  
  protected
  def find_story
    @story = @context.stories.find params[:story_id]
  end
  
end
