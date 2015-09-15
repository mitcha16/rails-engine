class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    render :json => finder(params)
  end
end
