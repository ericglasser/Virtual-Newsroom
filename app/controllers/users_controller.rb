class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :approve]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy, :approve]
  
  def index
    @title = "All Users"
    @id = current_user.organization_id
    @users = User.where(:organization_id => @id)
    #.paginate(:page => params[:page])
    @publication = Publication.find(:all)
  end
  
  def recruits
    @title = "Recruit Users"
    @id = current_user.organization_id
    @users = User.where(:organization_id => @id, :publication_id => nil)
    #.paginate(:page => params[:page])
  end

  def new
    @title = "Sign up"
    @user = User.new
    render :layout => "portal"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
    #@microposts = @user.microposts.paginate(:page => params[:page])
    @articles = @user.articles
    #.paginate(:page => params[:page])
    #@albums = @user.albums.paginate(:page => params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Congratulations! As soon as your editor approves your account, you will be free to use the site."
      redirect_to signin_path
    else
      @title = "Sign up"
      redirect_to signup_path
    end
  end

  def edit
    @title = "Edit User"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def approve
    @user = User.find(params[:id])
    if @user.update_attribute(:active, true)
      flash[:success] = "User approved."
      redirect_to users_path
    else
      redirect_to @user
    end
  end

  def recruit
    @user = User.find(params[:id])
    @publication = current_user.publication_id
    if @user.update_attribute(:publication_id, @publication)
      flash[:success] = "User recruited."
      redirect_to recruits_path
    else
      redirect_to @user
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def find_organization
    @organization = Organization.find_by_id(params[:organization_id])
  end

  def active_user
    redirect_to(root_path) unless current_user.active?
  end

end
