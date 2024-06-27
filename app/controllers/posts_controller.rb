class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # Set default value for name if it's blank
    params[:post][:name] = "Anonymous" if params[:post][:name].blank?
    
    @post = Post.new(post_params)
    @post.date_posted = Time.now # Set the date_posted to current time

    if @post.save
      redirect_to root_path, notice: "Post created successfully!"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end
end
