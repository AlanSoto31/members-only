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
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
     
      redirect_to posts_url
    else
      
      render 'new'
    end
  end
end
