class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.find_by_attribute(params)
  end

  def find_all
    respond_with Item.find_all_matches(params)
  end
end
