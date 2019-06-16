require 'test_helper'

class Api::V1::DoutorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_doutors_index_url
    assert_response :success
  end

end
