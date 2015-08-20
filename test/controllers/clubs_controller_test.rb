require 'test_helper'

class ClubsControllerTest < ActionController::TestCase
  test "should get all_show" do
    get :all_show
    assert_response :success
  end

  test "should get category_show" do
    get :category_show
    assert_response :success
  end

end
