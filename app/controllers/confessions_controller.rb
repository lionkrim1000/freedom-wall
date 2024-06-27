class ConfessionsController < ApplicationController
  def index
    @confessions = Confession.all
    puts "Confessions: #{@confessions}"
    render 'confession'
  end

  def show
    @confession = Confession.find(params[:id])
  end

  def new
    @confession = Confession.new
  end

  def create
    params[:confession][:name] = "Anonymous" if params[:confession][:name].blank?
    @confession = Confession.new(confession_params)
    @confession.date_posted = Time.current

    if @confession.save
      redirect_to confessions_path, notice: "Confession created successfully!"
    else
      render :new
    end
  end

  private

  def confession_params
    params.require(:confession).permit(:name, :content)
  end
end
