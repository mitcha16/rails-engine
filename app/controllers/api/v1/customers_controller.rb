class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    render :json => finder(params)
  end
end
