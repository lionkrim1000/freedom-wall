# app/controllers/admin/posts_controller.rb
class Admin::PostsController < ApplicationController
    before_action :authenticate_admin!
  
    def index
      @posts = Post.all
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path, notice: "Post created successfully!"
      else
        render :new
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to admin_posts_path, notice: "Post updated successfully!"
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to admin_posts_path, notice: "Post deleted successfully!"
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  end
  