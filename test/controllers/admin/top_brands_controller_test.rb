require 'test_helper'

class Admin::TopBrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_top_brands_index_url
    assert_response :success
  end

end
