require 'test_helper'

class DidsControllerTest < ActionController::TestCase
  setup do
    @did = dids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dids_bkp)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create did" do
    assert_difference('Did.count') do
      post :create, did: {  }
    end

    assert_redirected_to did_path(assigns(:did))
  end

  test "should show did" do
    get :show, id: @did
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @did
    assert_response :success
  end

  test "should update did" do
    patch :update, id: @did, did: {  }
    assert_redirected_to did_path(assigns(:did))
  end

  test "should destroy did" do
    assert_difference('Did.count', -1) do
      delete :destroy, id: @did
    end

    assert_redirected_to dids_path
  end
end
