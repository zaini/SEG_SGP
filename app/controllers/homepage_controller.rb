class HomepageController < ApplicationController
  def homepage
  end

  def create
    @name = params[:visitor][:name]
  end
  
end
