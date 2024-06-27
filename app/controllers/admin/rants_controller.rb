# app/controllers/admin/rants_controller.rb
class Admin::RantsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rants = Rant.all
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to admin_rants_path, notice: "Rant deleted successfully!"
  end

  def show
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to admin_rants_path, notice: "Rant deleted successfully!"
  end
end
