require 'test_helper'

class JudgesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get judges_show_url
    assert_response :success
  end
end
