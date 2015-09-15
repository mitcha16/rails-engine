class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by_attribute(params)
  end

  # def find_all
  #   render :json => find_all_matches(params)
  # end
end
