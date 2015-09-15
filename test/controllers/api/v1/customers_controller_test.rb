require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'Mike', customer[:first_name]
    assert_response :success
  end
end
