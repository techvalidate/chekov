class ContextsController < ApplicationController
  before_filter :find_current_release
  
  # GET /
  def index
    @user = User.find params[:user_id] unless params[:user_id].blank?
  end

  # GET /contexts/list
  def list
    send_data @release.list_csv, 
      type: 'text/csv; charset=iso-8859-1; header=present',
      disposition: 'attachment; filename=list.csv'
  end
  
  # GET /contexts/:id
  def show
    @context = @release.contexts.find params[:id]
    @user = User.find params[:user_id] unless params[:user_id].blank?
  end
  
  # GET /contexts/:id/edit
  def edit
    @context = @release.contexts.find params[:id]
  end
  
  # GET /contexts/new
  def new
    @context = @release.contexts.build
  end
  
  # POST /contexts
  def create
    @context = @release.contexts.build context_params
    @context.save!
    redirect_to @context
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end
  
  # PUT /contexts/:id
  def update
    @context = @release.contexts.find params[:id]
    @context.update_attributes! context_params
    redirect_to @context
  rescue ActiveRecord::RecordInvalid
    render action: 'edit'
  end

  protected
  def context_params
    params.require(:context).permit(:name, :description, :ie8, :ie9, :ie10, :ff, :chrome)
  end

end
