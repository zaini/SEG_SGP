class UsersController < ApplicationController
  before_action :redirect_to_root_if_not_logged_in_as_admin
  before_action :redirect_to_index_if_not_current_admins_user, only: [:show, :edit, :update, :delete, :destroy]

  # Gets all users belonging to the current user/admin and orders them by id
  def index
    @users = User.where(admin: current_user)
  end

  # Shows a particular user by the given id
  def show
    @user = User.find(params[:id])
  end

  # For the page to create a new user
  def new
    @user = User.new
  end

  # Where the post request to actually validate and create the user is processed
  def create
    @admin = current_user
    @user = User.new(user_params)
    @user.admin = @admin
    if @user.valid? && @user.save
      redirect_to(users_path)
    else
      render('new')
    end
  end

  # Finds the user by id to be edited
  def edit
    @user = User.find(params[:id])
  end

  # Similar to create. Updates the user based on the params in the form.
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(user_path(@user))
    else
      render('edit')
    end
  end

  # Finds the user for the delete user page
  def delete
    @user = User.find(params[:id])
  end

  # Actually deletes/destroys the user by id and redirects back to the users index
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_path)
  end

  private
    # Checks that the params given are permitted
    def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :email_confirmation, :password, :password_confirmation, :currency_id)
    end

    # Ensures user cannot view the users if you're not logged in as an admin
    def redirect_to_root_if_not_logged_in_as_admin
      unless logged_in? && is_admin?
        redirect_to(root_path)
      end
    end

    # Ensures user cannot view a user if it doesn't belong to the current admin
    def redirect_to_index_if_not_current_admins_user
      @user = User.find(params[:id])
      unless @user.admin == current_user
        redirect_to(users_path)
      end
    end
end
