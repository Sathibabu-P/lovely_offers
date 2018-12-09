require 'test_helper'

class Admin::CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_coupons_index_url
    assert_response :success
  end

end
