class PagesController < ApplicationController
  
  # Login page
  def homepage
  end

  def account
  end

  def admin_panel
  end

  # Account detail page
  def user_login
    @email = params[:page][:email]
    @password = params[:page][:password]
    @user = User.find_by(email: @email)
    if @user && @user.authenticate(@password)
      redirect_to(pages_account_path(id: @user))
    else
      redirect_to :controller => 'pages', :action => 'error'
    end
  end

  def admin_login
    @name = params[:page][:name]
    @password = params[:page][:password]
    @admin = Admin.find_by(username: @name)
    if @admin && @admin.authenticate(@password)
      redirect_to(pages_admin_panel_path(id: @admin))
    else
      redirect_to :controller => 'pages', :action => 'error'
    end
  end

  # Error message page
  def error
  end

end
