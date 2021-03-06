require 'test_helper'

class QueryManagerTest < ActiveSupport::TestCase
	def setup
		@q_manager = QueryManager.new
	end

	test "natural_amazon_search" do
		results = @q_manager.natural_amazon_search("The last book of .K. Rowling")
		assert_not_empty results
	end

	test "empty search" do
		results = @q_manager.natural_amazon_search("")
		assert_empty results
	end
end
