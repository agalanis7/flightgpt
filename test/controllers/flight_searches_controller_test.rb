require "test_helper"

class FlightSearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flight_searches_index_url
    assert_response :success
  end

  test "should get create" do
    get flight_searches_create_url
    assert_response :success
  end
end
