class PagesController < ApplicationController
  
  # Login page
  def homepage 
  end

  # Account detail page
  def create  
    @name = params[:page][:name]
    @password = params[:page][:password]
    if @name != Homepage::Name || @password != Homepage::PW
      redirect_to  :controller => 'pages', :action => 'error'
    end
  end

  # Error message page
  def error 
  end

end