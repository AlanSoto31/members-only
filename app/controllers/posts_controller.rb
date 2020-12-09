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
    if @post.save
      #flash[:success] = "post successfully created"
      redirect_to posts_url
    else
      #flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
end
