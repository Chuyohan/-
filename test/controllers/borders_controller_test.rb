require 'test_helper'

class BordersControllerTest < ActionController::TestCase
  setup do
    @border = borders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:borders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create border" do
    assert_difference('Border.count') do
      post :create, border: { content: @border.content, user_id: @border.user_id }
    end

    assert_redirected_to border_path(assigns(:border))
  end

  test "should show border" do
    get :show, id: @border
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @border
    assert_response :success
  end

  test "should update border" do
    patch :update, id: @border, border: { content: @border.content, user_id: @border.user_id }
    assert_redirected_to border_path(assigns(:border))
  end

  test "should destroy border" do
    assert_difference('Border.count', -1) do
      delete :destroy, id: @border
    end

    assert_redirected_to borders_path
  end
end
