require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'item 1', item[:name]
    assert_response :success
  end

  test '#find json' do
    get :find, format: :json, name: 'item 1'

    item = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'item 1', item[:name]
    assert_response :success
  end

  test '#find_all json' do
    get :find_all, format: :json, created_at: 'date'

    items = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, items.size
    assert_response :success
  end

  test '#random json' do
    get :random, format: :json

    assert_response :success
  end

  test '#invoice_items json' do
    get :invoice_items, format: :json, id: Item.first.id

    ii = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 2, ii.size
    assert_response :success
  end

  test '#merchant json' do
    get :merchant, format: :json, id: Item.first.id

    merchant = JSON.parse(response.body, symbolize_names: :true)

    assert_equal 'merchant 1', merchant[:name]
    assert_response :success
  end
end
