require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'bad', transaction[:result]
    assert_response :success
  end

  test '#find json' do
    get :find, format: :json, result: 'bad'

    transaction = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'bad', transaction[:result]
    assert_response :success
  end

  test '#find_all json' do
    get :find_all, format: :json, created_at: 'date'

    transactions = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, transactions.size
    assert_response :success
  end

  test '#random json' do
    get :random, format: :json

    assert_response :success
  end

  test '#invoice json' do
    get :invoice, format: :json, id: Transaction.first.id

    invoice = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'bad', invoice[:status]
    assert_response :success
  end
end
