class ManageUsersController < ApplicationController
  
  layout false

  def create_user
    render('manage_users/create_user')
  end

  def edit_user
  end

  def delete_user
  end
end
