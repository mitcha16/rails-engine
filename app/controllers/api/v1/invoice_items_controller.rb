class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    respond_with InvoiceItem.find_by_attribute(params)
  end

  def find_all
    respond_with InvoiceItem.find_all_matches(params)
  end

  def random
    respond_with InvoiceItem.random(params)
  end
end
