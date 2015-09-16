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

  def random
    respond_with Item.random(params)
  end

  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end
end
