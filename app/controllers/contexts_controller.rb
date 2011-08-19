class ContextsController < ApplicationController
  before_filter :find_current_release
  
  # GET /
  def index
  end
  
  # GET /contexts/:id
  def show
    @context = @release.contexts.find params[:id]
  end
  
  # GET /contexts/new
  def new
    @context = @release.contexts.build
  end
  
  # POST /contexts
  def create
    @context = @release.contexts.build params[:context]
    @context.save!
    redirect_to @context
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end

end
