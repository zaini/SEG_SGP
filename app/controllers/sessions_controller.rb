class SessionsController < ApplicationController
  def new_user
    if logged_in? && !is_admin?
      redirect_to :controller => 'pages', :action => 'account'
    end
  end

  def new_admin
    if logged_in? && is_admin?
      redirect_to :controller => 'pages', :action => 'admin_panel'
    end
  end

  def create_user
    user = User.find_by(email: params[:session][:email])
    # When user logged in sucessfully, redirect to the bank account page 
    if user && user.authenticate(params[:session][:password])
      login(user, false)
      redirect_to :controller => 'pages', :action => 'account' 
    else
      redirect_to :controller => 'pages', :action => 'error'
    end
  end

  def create_admin
    user = Admin.find_by(username: params[:session][:username])
    # When admin logged in sucessfully, redirect to the admin panel page
    if user && user.authenticate(params[:session][:password])
      login(user, true)
      redirect_to :controller => 'pages', :action => 'admin_panel'
    else
      redirect_to :controller => 'pages', :action => 'error'
    end
  end

  def destroy
    logout
    redirect_to root_path # When you logout, go to the home index page
  end

end
