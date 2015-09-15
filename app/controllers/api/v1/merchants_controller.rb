class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    merchant = Merchant.finder(params)
    render :json => merchant
  end
end
