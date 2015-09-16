class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    respond_with Merchant.all.sample
  end

  def items
    respond_with Merchant.find(params[:id]).items
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  def most_revenue
    respond_with Merchant.most_revenue(params)
  end

  def revenue
    respond_with Merchant.find(params[:id]).revenue
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
