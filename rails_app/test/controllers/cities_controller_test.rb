require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cities_url
    assert_response :success
  end

  test "should get cities by state" do
    state = states(:one)
    get cities_url, params: { state_id: state.id }
    assert_response :success
  end

  test "should get cities by name" do
    get cities_url, params: { name: 'Curitiba' }
    assert_response :success
  end
end
