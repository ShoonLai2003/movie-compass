class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(is_active: false)
    redirect_to admin_user_path(@user), notice: "退会処理を行いました。"
  end
end