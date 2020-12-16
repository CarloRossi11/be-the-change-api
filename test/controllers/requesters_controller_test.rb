require 'test_helper'

class RequestersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requester = requesters(:one)
  end

  test "should get index" do
    get requesters_url, as: :json
    assert_response :success
  end

  test "should create requester" do
    assert_difference('Requester.count') do
      post requesters_url, params: { requester: { contact_info: @requester.contact_info, name: @requester.name, opportunity_description: @requester.opportunity_description, opportunity_type: @requester.opportunity_type, user_id: @requester.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show requester" do
    get requester_url(@requester), as: :json
    assert_response :success
  end

  test "should update requester" do
    patch requester_url(@requester), params: { requester: { contact_info: @requester.contact_info, name: @requester.name, opportunity_description: @requester.opportunity_description, opportunity_type: @requester.opportunity_type, user_id: @requester.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy requester" do
    assert_difference('Requester.count', -1) do
      delete requester_url(@requester), as: :json
    end

    assert_response 204
  end
end
