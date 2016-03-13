class HomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "not authenticated should redirect" do
    get :index
    assert_response :redirect
    assert_response 302
	end
	
	test "signed_in should get home#index" do
		sign_in users(:one)
    get :index
		assert_response :success
  end
end
