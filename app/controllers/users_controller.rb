class UsersController < ApplicationController
  def index
  end

  def show
    @user = Users.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destory
  end
end