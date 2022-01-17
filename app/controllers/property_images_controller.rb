class PropertyImages < ApplicationController
  before_action :set_property_image, only: [:show, :update, :destroy]

  def index
    @property_images = PropertyImage.all

    render json: @property_images
  end

  def create
    @property_image = PropertyImage.new(set_params)
    if @property_image.save
      render json: { message: "successfully updated" }, status: 200
    else
      render json: { errors: errors.full_messages }
  end

  def update
    if @property_image.update(set_params)
      render json: { message: "successfully updated" }, status: 200
    else
      render json: { errors: errors.full_messages }
    end
  end

  def destroy
    if @property_image.destroy
      render json: { message: "successfully destroy" }, status: 200
    else
      render json: { errors: errors.full_messages }
    end
  end

  private

  def set_params
    params.require(:anosafra_user).permit(:image, :property_id)
  end

  def set_property_image
    @properties = PropertyImage.find(params[:id])
  end

end
