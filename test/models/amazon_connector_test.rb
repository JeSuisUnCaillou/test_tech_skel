require 'test_helper'
class AmazonConnectorTest < ActiveSupport::TestCase
	def setup
		@amazon = AmazonConnector.new
	end

	test "AmazonConnector attributes" do
		assert_respond_to @amazon, :amazon_response
		assert_respond_to @amazon, :answers
	end

	test "Amazon connects" do
		assert_not_empty @amazon.ask("test", "Books")
	end

	test "basic research" do
		@amazon.ask("Mazda", "Automotive")
		assert_not_empty(@amazon.answers)
		assert_equal("Mazda Lanyard Keychain Holder", @amazon.best_answer["ItemAttributes"]["Title"])
	end
end
