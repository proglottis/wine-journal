require 'test_helper'

class WinesControllerTest < ActionController::TestCase
  setup do
    @wine = wines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wine" do
    assert_difference('Wine.count') do
      post :create, :wine => @wine.attributes
    end

    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should show wine" do
    get :show, :id => @wine.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wine.to_param
    assert_response :success
  end

  test "should update wine" do
    put :update, :id => @wine.to_param, :wine => @wine.attributes
    assert_redirected_to wine_path(assigns(:wine))
  end

  test "should destroy wine" do
    assert_difference('Wine.count', -1) do
      delete :destroy, :id => @wine.to_param
    end

    assert_redirected_to wines_path
  end
end
