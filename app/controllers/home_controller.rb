class HomeController < ApplicationController
  def index
    @posts = Post.ransack.result.page(params[:page]).per(10)

    post_list = @posts.to_a
    @first_post = post_list.shift
    @other_post = post_list
    @users = User.all.order(updated_at: :desc).page(params[:page]).per(2)
  end

  def show
  end

  def terms
  end
end
