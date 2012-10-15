class ArticlesController < ApplicationController
  
  
  def index
   list
   render "list"
  end
  
  def list 
    @title = "View Articles"
    @id = current_user.publication_id
    @articles = Article.where(:publication_id => @id).paginate(:page => params[:page])
  end
  
  def show
    @article = Article.find(params[:id])
    @title = @article.name
  end
  
  def new
    @title = "New Article"
    @article = Article.new
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
    @article = Article.new(params[:article])
    @article.publication_id = current_user.publication_id
      if @article.save
       flash[:success] = "Article created!"
       if @article.story
       redirect_to @article.story
     else
       redirect_to @article
     end
      else
        @title = "Sign up"
        render 'new'
      end
  end
  
  def find_story 
    if params[:story_id]
      @story = Story.find_by_id(params[:story_id])
    end
  end
  
  def destroy
      article = Article.find(params[:id])
      @story = article.story
      article.destroy
      flash[:success] = "Article destroyed."
      redirect_to @story
  end
  
  def edit
    @title = "Edit Article"
    @article = Article.find(params[:id])
  end
  
  def update
      @article = Article.find(params[:id])
      if @article.update_attributes(params[:article])
        flash[:success] = "Article updated."
        redirect_to @article
      else
        @title = "Edit Article"
        render 'edit'
    end
  end
  

end
