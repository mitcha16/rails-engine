require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test '#show json' do
    get :show, format: :json, id: InvoiceItem.first.id

    ii = JSON.parse(response.body, symbolize_names: :true)

    assert_equal '9', ii[:quantity]
    assert_response :success
  end
end
