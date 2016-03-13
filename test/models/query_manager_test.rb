require 'test_helper'

class QueryManagerTest < ActiveSupport::TestCase
	def setup
		@q_manager = QueryManager.new
	end

	test "natural_amazon_search" do
		results = @q_manager.natural_amazon_search("buy me a mazda car")
		assert_not_empty results
	end
end
