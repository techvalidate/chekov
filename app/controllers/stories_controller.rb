class StoriesController < ApplicationController
  before_filter :find_current_release
  before_filter :find_context
  
  # GET /contexts/:context_id/stories/new
  def new
    @story = @context.stories.build
  end
  
  # POST /contexts/:context_id/stories
  def create
    @story = @context.stories.build params[:story]
    @story.save!
    redirect_to @context
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end
  
  protected
  def find_context
    @context = @release.contexts.find params[:context_id]
  end
  
end
