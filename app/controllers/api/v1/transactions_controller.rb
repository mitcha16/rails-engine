class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    render :json => finder(params)
  end
end
