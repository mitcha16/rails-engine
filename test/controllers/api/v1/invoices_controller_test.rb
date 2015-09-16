require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'good', invoice[:status]
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

  test '#random json' do
    get :random, format: :json

    assert_response :success
  end

  test '#transactions json' do
    get :transactions, format: :json, id: Invoice.first.id

    t = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'good', t.first[:result]
    assert_response :success
  end

  test '#invoice items json' do
    get :invoice_items, format: :json, id: Invoice.last.id

    ii = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, ii.size
    assert_response :success
  end

  test '#items json' do
    get :items, format: :json, id: Invoice.last.id

    i = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, i.size
    assert_response :success
  end
end
