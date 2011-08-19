class ContextsController < ApplicationController
  before_filter :find_release
  
  # GET /releases/:release_id/contexts/:id
  def show
    @context = @release.contexts.find params[:id]
  end
  
  # GET /releases/:release_id/contexts/new
  def new
    @context = @release.contexts.build
  end
  
  # POST /releases/:release_id/contexts
  def create
    @context = @release.contexts.build params[:context]
    @context.save!
    redirect_to [@release, @context]
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end
  
  protected
  def find_release
    @release = Release.find params[:release_id]
  end
  
end
