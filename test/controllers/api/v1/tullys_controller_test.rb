require 'test_helper'

class Api::V1::TullysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_tullys_index_url
    assert_response :success
  end

end
