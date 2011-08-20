class ReleasesController < ApplicationController
  
  # GET /release/new
  def new
    @release = Release.new
  end
  
  # POST /release
  def create
    @release = Release.new params[:release]
    @release.save!
    redirect_to root_url
  rescue ActiveRecord::RecordInvalid
    render action: 'new'
  end
  
end