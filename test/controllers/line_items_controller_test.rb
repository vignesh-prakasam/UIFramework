require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, line_item: { address_id: @line_item.address_id, equipment_id: @line_item.equipment_id, equipment_price: @line_item.equipment_price, first_name: @line_item.first_name, last_name: @line_item.last_name, middle_name: @line_item.middle_name, number: @line_item.number, order_id: @line_item.order_id, product_id: @line_item.product_id, service_price: @line_item.service_price, total_price_per_seat: @line_item.total_price_per_seat }
    end

    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { address_id: @line_item.address_id, equipment_id: @line_item.equipment_id, equipment_price: @line_item.equipment_price, first_name: @line_item.first_name, last_name: @line_item.last_name, middle_name: @line_item.middle_name, number: @line_item.number, order_id: @line_item.order_id, product_id: @line_item.product_id, service_price: @line_item.service_price, total_price_per_seat: @line_item.total_price_per_seat }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to line_items_path
  end
end
