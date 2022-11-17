class PlantTagsController < ApplicationController
  before_action :set_plant

  def new
    @plant_tag = PlantTag.new
  end

  def create
    @plant_tag = PlantTag.new(plant_tag_params)
    @plant_tag.plant = @plant

    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
