class AdminsController < ApplicationController
  def index
    @admins = Admin.order(:id)
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.valid? && @admin.save
      redirect_to(admins_path)
    else
      render('new')
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to(admin_path(@admin))
    else
      render('edit')
    end
  end

  def delete
    @admin = Admin.find(params[:id])
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to(admins_path)
  end

  private
    def admin_params
      params.require(:admin).permit(:username, :email, :email_confirmation, :password, :password_confirmation)
    end
end
