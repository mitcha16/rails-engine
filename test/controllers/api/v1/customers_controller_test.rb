require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'Mike', customer[:first_name]
    assert_response :success
  end

  test '#find json' do
    get :find, format: :json, first_name: 'Mitch'

    customer = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'Mitch', customer[:first_name]
    assert_response :success
  end

  test '#find_all json' do
    get :find_all, format: :json, created_at: 'date'

    customers = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, customers.size
    assert_response :success
  end

  test '#random json' do
    get :random, format: :json

    assert_response :success
  end
end
