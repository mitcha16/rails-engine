require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'bad', transaction[:result]
    assert_response :success
  end
end
