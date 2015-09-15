class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    render :json => finder(params)
  end
end
