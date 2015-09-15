class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find(params[:id])
  end

  def find
    render :json => finder(params)
  end
end
