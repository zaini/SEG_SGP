class UsersController < ApplicationController
  before_action :redirect_to_root_if_not_logged_in_as_admin
  before_action :redirect_to_index_if_not_current_admins_user, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @users = User.where(admin: current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(user_path(@user))
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_path)
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :email_confirmation, :password, :password_confirmation)
    end

    def redirect_to_root_if_not_logged_in_as_admin
      unless logged_in? && is_admin?
        redirect_to(root_path)
      end
    end

    def redirect_to_index_if_not_current_admins_user
      @user = User.find(params[:id])
      unless @user.admin == current_user
        redirect_to(users_path)
      end
    end
end
