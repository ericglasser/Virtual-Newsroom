class PublicationsController < ApplicationController
  
  def show
    
    if signed_in?
    @publication = Publication.find(current_user.publication.id)
    @title = @publication.name
    @stories = @publication.stories.paginate(:page => params[:page])
    @activities = @publication.activities.paginate(:page => params[:page])
  else
    redirect_to signin_path
  end
  end
    
end
