require 'test_helper'
class WitConnectorTest < ActiveSupport::TestCase
	def setup
		@wit = WitConnector.new
	end

	test "WitConnector attributes" do
		assert_respond_to @wit, :wit_response
		assert_respond_to @wit, :answers
	end

	test "Wit connects" do
		assert_not_empty @wit.ask("test")
	end

	test "basic question" do
		@wit.ask("I want to buy a car for 100€")
		assert_not_empty(@wit.answers)
		assert_not_empty(@wit.best_answer["entities"]["amount_of_money"])
		assert_equal("buy_car", @wit.best_answer["intent"])
	end
end
