class AdminsController < ApplicationController
  # Gets all admins and orders them by id
  def index
    @admins = Admin.order(:id)
  end

  # Shows a particular admin by the given id
  def show
    @admin = Admin.find(params[:id])
  end

  # For the page to create a new admin
  def new
    @admin = Admin.new
  end

  # Where the post request to actually validate and create the admin is processed
  def create
    @admin = Admin.new(admin_params)
    if @admin.valid? && @admin.save
      redirect_to(admin_login_path)
    else
      render('new')
    end
  end

  # Finds the admin by id to be edited
  def edit
    @admin = Admin.find(params[:id])
  end

  # Similar to create. Updates the admin based on the params in the form.
  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to(admin_path(@admin))
    else
      render('edit')
    end
  end

  # Finds the admin for the delete admin page
  def delete
    @admin = Admin.find(params[:id])
  end

  # Actually deletes/destroys the admin by id and redirects back to the admin index
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to(admin_index_path)
  end

  private
    # Checks that the params given are permitted
    def admin_params
      params.require(:admin).permit(:username, :email, :email_confirmation, :password, :password_confirmation)
    end
end
