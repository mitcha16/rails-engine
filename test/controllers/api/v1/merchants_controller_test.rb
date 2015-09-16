require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'merchant 2', merchant[:name]
    assert_response :success
  end

  test '#find json' do
    get :find, format: :json, name: 'merchant 1'

    merchant = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'merchant 1', merchant[:name]
    assert_response :success
  end

  test '#find_all json' do
    get :find_all, format: :json, created_at: 'date'

    merchants = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, merchants.size
    assert_response :success
  end

  test '#random json' do
    get :random, format: :json

    assert_response :success
  end
end
