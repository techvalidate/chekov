class StoriesController < ApplicationController
  before_filter :find_current_release
  before_filter :find_context
  
  # GET /contexts/:context_id/stories/:id
  def show
    @story = @context.stories.find params[:id]
  end
  
  # GET /contexts/:context_id/stories/new
  def new
    @story = @context.stories.build
    10.times{ @story.elements.build }
  end
  
  # POST /contexts/:context_id/stories
  def create
    @story = @context.stories.build params[:story]
    @story.save!
    redirect_to @context
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end
  
  # PUT /contets/:context_id/stories/:id
  def update
    @story = @context.stories.find params[:id]
    @story.update_attributes! params[:story]
    redirect_to [@context, @story]
  rescue ActiveRecord::RecordInvalid
    render action: 'show'
  end
  
end