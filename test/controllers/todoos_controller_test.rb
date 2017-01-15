require 'test_helper'

class TodoosControllerTest < ActionController::TestCase
  setup do
    @todoo = todoos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todoos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todoo" do
    assert_difference('Todoo.count') do
      post :create, todoo: { name: @todoo.name, priority: @todoo.priority, time: @todoo.time }
    end

    assert_redirected_to todoo_path(assigns(:todoo))
  end

  test "should show todoo" do
    get :show, id: @todoo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @todoo
    assert_response :success
  end

  test "should update todoo" do
    patch :update, id: @todoo, todoo: { name: @todoo.name, priority: @todoo.priority, time: @todoo.time }
    assert_redirected_to todoo_path(assigns(:todoo))
  end

  test "should destroy todoo" do
    assert_difference('Todoo.count', -1) do
      delete :destroy, id: @todoo
    end

    assert_redirected_to todoos_path
  end
end
