class Admin::ConfessionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @confessions = Confession.all
  end

  def destroy
    @confession = Confession.find(params[:id])
    @confession.destroy
    redirect_to admin_confessions_path, notice: "Confession deleted successfully!"
  end

  def show
    @confession = Confession.find(params[:id])
    @confession.destroy
    redirect_to admin_confessions_path, notice: "Confession deleted successfully!"
  end
end
