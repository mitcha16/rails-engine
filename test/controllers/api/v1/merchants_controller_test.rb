require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'merchant 1', merchant[:name]
    assert_response :success
  end

  test '#find json' do
    get :find, format: :json, name: 'merchant 1'

    merchant = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'merchant 1', merchant[:name]
    assert_response :success
  end

  test '#find_all json' do
    get :find_all, format: :json, created_at: '2012-03-27 14:53:59 UTC'

    merchants = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, merchants.size
    assert_response :success
  end

  test '#random json' do
    get :random, format: :json

    assert_response :success
  end

  test '#items relationships json' do
    get :items, format: :json, id: Merchant.first.id
    items = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, items.size
    assert_response :success
  end

  test '#invoices relationships json' do
    get :invoices, format: :json, id: Merchant.first.id
    invoice = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'good', invoice.first[:status]
    assert_response :success
  end

  test '#most_revenue json' do
    get :most_revenue, format: :json, quantity: 1
    merchants = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'merchant 1', merchants.first[:name]
    assert_response :success
  end

  test '#revenue json' do
    get :revenue, format: :json, id: Merchant.last.id
    revenue = JSON.parse(response.body, symbolize_names: :true)

    assert_equal '0.0', revenue[:revenue]
    assert_response :success
  end
end
