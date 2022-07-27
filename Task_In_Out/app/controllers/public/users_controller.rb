class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit, :update, :withdraw]

  def index
    @users = User.all
  end

  def show
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to users_path(current_user)
    else
      render "edit"
    end

  end

  def confirm
  end

  def withdraw
    @user.update(is_active: false)
    reset_session
    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :email, :introduction, :genre_id)
  end

  def ensure_correct_user
     @user = current_user
  end
end
