class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # params[:plant_tag][:tag] => ["3", "4"]
    # @plant_tag = PlantTag.new(plant_tag_params)
    # @plant_tag.plant = @plant
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new
    # end
    @tags = Tag.where(id: params[:plant_tag][:tag])
    @tags.each do |tag|
      # tag => La première instance de Tag récupéré par le formulaire
      PlantTag.create(tag: tag, plant: @plant)
    end
    redirect_to garden_path(@plant.garden)
  end

  # private

  # def plant_tag_params
  #   params.require(:plant_tag).permit(:tag_id)
  # end
end
