class PagesController < ApplicationController
  
  # Login page
  def homepage
  end

  # Account detail page
  def user_login
    @name = params[:page][:name]
    @password = params[:page][:password]

    if !User.exists?(first_name: @name, password: @password)
      redirect_to :controller => 'pages', :action => 'error'
    end
  end

  def admin_login
    @name = params[:page][:name]
    @password = params[:page][:password]
    @admin = Admin.find_by(username: @name, password: @password)
    if @admin
      redirect_to(admin_path(@admin))
    else
      redirect_to :controller => 'pages', :action => 'error'
    end
  end

  # Error message page
  def error
  end

end
