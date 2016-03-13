require 'test_helper'

class SearchTest < ActiveSupport::TestCase
	def setup
		@user = users(:one)
		@search = searches(:one)
	end

	test "search attributes" do
		assert_respond_to @search, :sentence
		assert_respond_to @search, :user
	end

	
end
