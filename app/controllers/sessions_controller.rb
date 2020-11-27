class SessionsController < ApplicationController
  def new_user
  end

  def new_admin
  end

  def create_user
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user, false)
      redirect_to(pages_account_path()) # when you login, go to the bank account page
    else
      # TODO merge errors with new
      redirect_to :controller => 'pages', :action => 'error'
      # render 'new'
    end
  end

  def create_admin
    user = Admin.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      login(user, true)
      redirect_to(pages_admin_panel_path()) # when you login, go to the admin panel page
    else
      # TODO merge errors with new
      redirect_to :controller => 'pages', :action => 'error'
      # render 'new'
    end
  end

  def destroy
    logout
    redirect_to pages_index_path # when you logout, go to the home index page
  end
end
