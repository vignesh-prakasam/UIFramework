require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_check)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service" do
    assert_difference('Service.count') do
      post :create, service: { address1: @service.address1, address2: @service.address2, city: @service.city, company_name: @service.company_name, email_address: @service.email_address, first_name: @service.first_name, last_name: @service.last_name, postal_code: @service.postal_code, prefix: @service.prefix, state: @service.state, suffix: @service.suffix }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test "should show service" do
    get :show, id: @service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service
    assert_response :success
  end

  test "should update service" do
    patch :update, id: @service, service: { address1: @service.address1, address2: @service.address2, city: @service.city, company_name: @service.company_name, email_address: @service.email_address, first_name: @service.first_name, last_name: @service.last_name, postal_code: @service.postal_code, prefix: @service.prefix, state: @service.state, suffix: @service.suffix }
    assert_redirected_to service_path(assigns(:service))
  end

  test "should destroy service" do
    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end
