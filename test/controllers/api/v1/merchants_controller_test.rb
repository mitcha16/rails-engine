require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'merchant 2', merchant[:name]
    assert_response :success
  end
end
