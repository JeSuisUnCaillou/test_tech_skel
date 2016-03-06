require 'test_helper'
class WitConnectorTest < ActiveSupport::TestCase
	def setup
		@wit = WitConnector.new
	end

	test "Wit connects" do
		assert_not_empty @wit.ask("test")
	end
end
