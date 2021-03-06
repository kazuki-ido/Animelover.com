class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:mypage, :edit, :update, :index]
  
  def mypage
    redirect_to user_path(current_user)
  end
  
  def index
    @users = User.all.page(params[:page]).per(5)
  end
  
  def show
  end
  
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
  end
  
  def user_params
    params.fetch(:user, {}).permit(:name,:profile,:image,:picture)
  end
end
