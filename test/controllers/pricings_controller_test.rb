require "test_helper"

class PricingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pricing = pricings(:one)
  end

  test "should get index" do
    get pricings_url, as: :json
    assert_response :success
  end

  test "should create pricing" do
    assert_difference('Pricing.count') do
      post pricings_url, params: { pricing: { user_id: @pricing.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show pricing" do
    get pricing_url(@pricing), as: :json
    assert_response :success
  end

  test "should update pricing" do
    patch pricing_url(@pricing), params: { pricing: { user_id: @pricing.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy pricing" do
    assert_difference('Pricing.count', -1) do
      delete pricing_url(@pricing), as: :json
    end

    assert_response 204
  end
end
