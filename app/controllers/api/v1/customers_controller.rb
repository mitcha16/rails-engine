class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.find_by_attribute(params)
  end

  def find_all
    respond_with Customer.find_all_matches(params)
  end

  def random
    respond_with Customer.random(params)
  end

  def invoices
    respond_with Customer.find(params[:id]).invoices
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end
end
