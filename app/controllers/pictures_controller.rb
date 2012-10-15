class PicturesController < ApplicationController
  
  def index
    list
    render('list')
  end

  def list
    @pictures = Picture.all
  end

  def show
    @picture= Picture.find(params[:id])
  end

  def new
    @title = "New Picture"
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params[:picture])
    @picture.user_id = current_user.id
    if @picture.save
      flash[:success] = "Picture Added"
      redirect_to(:action => 'show', :id => @picture.id)
    else
      render 'new'
    end
  end
  
    def edit
    @picture = Picture.find(params[:id])
  end
  
  def update 
     @picture = Picture.find(params[:id])
    if @picture.update_attributes(params[:picture])
      flash[:success] = "Picture Edited"
      redirect_to(:action => 'show', id => params[:id])
    else
      render "edit"
    end
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to(@picture.album)
  end
  
end
