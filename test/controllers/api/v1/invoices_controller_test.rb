require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'bad', invoice[:status]
    assert_response :success
  end
end
