class AlbumsController < ApplicationController
  
  def index
    list
    render "list"
  end

  def list
    @title = "View Albums"
    @id = current_user.publication_id
    @albums = Album.where(:publication_id => @id).paginate(:page => params[:page])
  end

  def show
    @album = Album.find(params[:id])
    @title = @album.name
  end

  def new
    @title = "New Album"
    @album = Album.new
    @id = params[:id]
    if @id
    @story = Story.find(@id)
    else
    @id = current_user.publication_id
    @stories = Story.where(:publication_id => @id)
    @select = 1
    end
  end

  def create
    @album = Album.new(params[:album])
    @album.user_id = current_user.id
    @album.publication_id = current_user.publication_id
    if @album.save
      flash[:success] = "Album Added"
      if @album.story
      redirect_to(@album.story)
    else
      redirect_to @album
    end
    else
      render 'new'
    end
  end
  
  def edit
    @album = Album.find(params[:id])
  end
  
  def update 
     @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:success] = "Album Updated"
      redirect_to(:action => 'show', id => params[:id])
    else
      render 'list'
    end
  end
  
  def destroy
    Album.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end
  
end
