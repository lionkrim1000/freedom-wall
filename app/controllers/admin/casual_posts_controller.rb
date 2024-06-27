class Admin::CasualPostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @casual_posts = CasualPost.all
  end

  def destroy
    @casual_post = CasualPost.find(params[:id])
    @casual_post.destroy
    redirect_to admin_casual_posts_path, notice: "Post deleted successfully!"
  end

  def show
    @casual_post = CasualPost.find(params[:id])
    @casual_post.destroy
    redirect_to admin_rants_path, notice: "Post deleted successfully!"
  end
end
