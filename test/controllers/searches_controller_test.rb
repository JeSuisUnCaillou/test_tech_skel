require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
		@user = users(:one)
		sign_in @user
    @search = searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searches)
  end

  test "should create search" do
    assert_difference('Search.count') do
      post :create, search: { sentence: "rablabla" }
    end
    assert_redirected_to search_path(assigns(:search))
		assert_equal "rablabla", @user.searches.last.sentence
  end

  test "should show search" do
    get :show, id: @search
    assert_response :success
  end

	test "shouldn't show search of someone else" do
		get :show, id: users(:two).searches.first.id
		assert_response :unauthorized
	end

  test "should destroy search" do
    assert_difference('Search.count', -1) do
      delete :destroy, id: @search
    end

    assert_redirected_to searches_path
  end

	test "shouldn't destroy search of someone else" do
		delete :destroy, id: users(:two).searches.first.id
		assert_response :unauthorized
	end
end
