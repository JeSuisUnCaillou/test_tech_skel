require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
		sign_in users(:one)
    @search = searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searches)
  end

  test "should create search" do
    assert_difference('Search.count') do
      post :create, search: { sentence: @search.sentence, user_id: @search.user_id }
    end

    assert_redirected_to search_path(assigns(:search))
  end

  test "should show search" do
    get :show, id: @search
    assert_response :success
  end

  test "should destroy search" do
    assert_difference('Search.count', -1) do
      delete :destroy, id: @search
    end

    assert_redirected_to searches_path
  end
end
