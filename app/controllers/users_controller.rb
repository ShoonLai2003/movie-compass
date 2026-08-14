class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @user = current_user
    @posts = current_user.posts.order(created_at: :desc)
  end
end
