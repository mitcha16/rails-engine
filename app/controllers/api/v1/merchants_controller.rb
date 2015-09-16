class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by_attribute(params)
  end

  def find_all
    respond_with Merchant.find_all_matches(params)
  end

  def random
    respond_with Merchant.random(params)
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end
end
