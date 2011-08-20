class ElementsController < ApplicationController
  before_filter :find_current_release
  
  # DELETE /elements/:id
  def destroy
    @element = Element.find params[:id]
    @element.destroy
    redirect_to [@element.story.context, @element.story]
  end
  
end
