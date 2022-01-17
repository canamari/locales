class Properties < ApplicationController
  before_action :set_property, only: [:show, :update, :destroy]

  def index
    @properties = Property.all

    render json: @properties
  end

  def create
    @property = Property.new(set_params)
    if @property.save
      render json: { message: "successfully updated" }, status: 200
    else
      render json: { errors: errors.full_messages }
  end

  def update
    if @property.update(set_params)
      render json: { message: "successfully updated" }, status: 200
    else
      render json: { errors: errors.full_messages }
    end
  end

  def destroy
    if @property.destroy
      render json: { message: "successfully destroy" }, status: 200
    else
      render json: { errors: errors.full_messages }
    end
  end

  private

  def set_params
    params.require(:anosafra_user).permit(:name, :addres,
                                          inventory_attributes: [:id, :image]
                                          )
  end

  def set_property
    @properties = Property.find(params[:id])
  end

end
