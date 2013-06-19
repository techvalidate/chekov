class ReleasesController < ApplicationController
  
  # GET /release/new
  def new
    @release = Release.new
  end
  
  # POST /release
  def create
    @last_release = @release = Release.current
    @release = Release.new release_params
    @release.save!
    @release.import_contexts_from @last_release
    @last_release.update_attribute :current, false
    redirect_to root_url
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end

  protected
  def release_params
    params.require(:release).permit(:name)
  end
  
end
