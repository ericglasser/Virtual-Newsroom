class StoriesController < ApplicationController

  def index
    @title = "View Stories"
    @id = current_user.publication_id
    @stories = Story.where(:publication_id => @id)
    #.paginate(:page => params[:page])
  end

  def show
    @story = Story.find(params[:id])
    @title = @story.name
    @articles = @story.articles
    #.paginate(:page => params[:page])
    @albums = @story.albums
    #.paginate(:page => params[:page])
  end
  
  def new
    @title = "New Story"
    @story = Story.new
  end
  
  def create
     @story = Story.new(params[:story])
     @story.publication_id = current_user.publication_id
      if @story.save
       flash[:success] = "Story created!"
       redirect_to current_user.publication
      else
        @title = "Sign up"
        render 'new'
      end
  end
  
  def destroy
      Story.find(params[:id]).destroy
      flash[:success] = "Story destroyed."
      redirect_to current_user.publication
  end
  
  def edit
    @title = "Edit Story"
    @story = Story.find(params[:id])
  end
  
  def update
      @story = Story.find(params[:id])
      if @story.update_attributes(params[:story])
        flash[:success] = "Story updated."
        redirect_to @story
      else
        @title = "Edit Story"
        render 'edit'
    end
  end

end
