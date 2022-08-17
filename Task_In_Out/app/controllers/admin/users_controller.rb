class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(is_active: false)
    redirect_to admin_users_path
  end

  def confirm
  end

  def withdraw

  end

end
