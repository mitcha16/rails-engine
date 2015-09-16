class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    respond_with Invoice.find_by_attribute(params)
  end

  def find_all
    respond_with Invoice.find_all_matches(params)
  end

  def random
    respond_with Invoice.random(params)
  end

  def transactions
    respond_with Invoice.find(params[:id]).transactions
  end

  def invoice_items
    respond_with Invoice.find(params[:id]).invoice_items
  end

  def items
    respond_with Invoice.find(params[:id]).items
  end

  def customer
    respond_with Invoice.find(params[:id]).customer
  end

  def merchant
    respond_with Invoice.find(params[:id]).merchant
  end
end
