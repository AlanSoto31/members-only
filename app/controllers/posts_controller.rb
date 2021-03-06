class PostsController < ApplicationController
  include PostsHelper

  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash.notice = 'Post created!!!'
      redirect_to posts_url
    else
      render 'new'
    end
  end
end
