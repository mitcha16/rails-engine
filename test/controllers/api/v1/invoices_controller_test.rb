require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'bad', invoice[:status]
    assert_response :success
  end

  test '#find json' do
    get :find, format: :json, status: 'good'

    invoice = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'good', invoice[:status]
    assert_response :success
  end

  test '#find_all json' do
    get :find_all, format: :json, created_at: 'date'

    invoices = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, invoices.size
    assert_response :success
  end
end
