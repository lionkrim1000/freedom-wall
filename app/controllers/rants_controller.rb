class RantsController < ApplicationController
  before_action :set_rant, only: [:show, :edit, :update, :destroy]

  def index
    @rants = Rant.all
  end
  
  def show
  end

  def new
    @rant = Rant.new
  end

  def create
    set_default_name_if_blank
    @rant = Rant.new(rant_params)
    @rant.date_posted = Time.current

    if @rant.save
      redirect_to rants_path, notice: "Rant created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rant.update(rant_params)
      redirect_to @rant, notice: "Rant updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @rant.destroy
    redirect_to rants_path, notice: "Rant deleted successfully!"
  end

  private

  def set_rant
    @rant = Rant.find(params[:id])
  end

  def set_default_name_if_blank
    params[:rant][:name] = "Anonymous" if params[:rant][:name].blank?
  end

  def rant_params
    params.require(:rant).permit(:name, :content)
  end
end
