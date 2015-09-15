class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.find_by_attribute(params)
  end
end
