class PagesController < ApplicationController
  
  # Login page
  def homepage 
  end

  # Account detail page
  def create  
    @name = params[:page][:name]
    @password = params[:page][:password]

    if !Users.exists?(first_name: @name, password: @password)
      redirect_to  :controller => 'pages', :action => 'error'
    end
  end

  # Error message page
  def error 
  end

end
