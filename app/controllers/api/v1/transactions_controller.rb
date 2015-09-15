class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    respond_with Transaction.find_by_attribute(params)
  end

  def find_all
    respond_with Transaction.find_all_matches(params)
  end
end
