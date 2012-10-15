class SessionsController < ApplicationController
  
  def new
    @title = "Sign in"
    render :layout => "portal"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
        if user.nil?
          flash.now[:error] = "Invalid email/password combination."
          @title = "Sign in"
          render :action => 'new',:layout => "portal"or i
          
        elsif !user.active
          flash.now[:error] = "You must wait for your account to be activated."
          @title = "Sign in"
          render :action => 'new',:layout => "portal"
      else
        sign_in user
        redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to signin_path
  end

end
