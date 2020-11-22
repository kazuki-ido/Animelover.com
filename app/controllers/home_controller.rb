class HomeController < ApplicationController
  def index
    @posts = Post.ransack.result.page(params[:page]).per(10)

    post_list = @posts.to_a
    @first_post = post_list.shift
    @other_post = post_list
  end

  def show
  end

  def terms
  end
end
