class CasualPostsController < ApplicationController
  def index
    @casual_posts = CasualPost.all
    puts "Casual Posts: #{@casual_posts}"
    render 'index' # Explicitly render the casual_post_page.html.erb template
  end 

  def show
    @casual_post = CasualPost.find(params[:id])
  end

  def new
    @casual_post = CasualPost.new
  end

  def create
    params[:casual_post][:name] = "Anonymous" if params[:casual_post][:name].blank?
    @casual_post = CasualPost.new(casual_post_params)
    @casual_post.date_posted = Time.current

    if @casual_post.save
      redirect_to casual_posts_path, notice: "Casual post created successfully!"
    else
      render :new
    end
  end

  private

  def casual_post_params
    params.require(:casual_post).permit(:name, :content)
  end
end
