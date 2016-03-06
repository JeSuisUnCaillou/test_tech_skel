require 'test_helper'
class AmazonConnectorTest < ActiveSupport::TestCase
	def setup
		@amazon = AmazonConnector.new
	end

	test "Amazon connects" do
		assert_not_empty @amazon.ask("test")
	end
end
