require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = users(:one)
	end

	test "user attributes" do
		assert_respond_to @user, :email
		assert_respond_to @user, :password
		assert_respond_to @user, :searches
	end
end
