class AmazonConnector
	attr_accessor :amazon_response
	attr_accessor :answers

	CATEGORIES = {
		'buy_books' => 'Books',
		'buy_car' => 'Automitive'
	}

	def test_ask(item)
		begin
			ask(item)
		rescue Excon::Errors::BadRequest => e
			ap e.response.body
		end
	end

	# args : category
	def ask(keywords, category)
		request = Vacuum.new
		request.configure(
    	aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    	aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    	associate_tag: 'tag'
		)
		response = request.item_search(
			query: {
				'Keywords' => keywords, 
				'SearchIndex' => category
			}
		)
		@amazon_response = response.to_h
		@answers = @amazon_response["ItemSearchResponse"]["Items"]["Item"]
	end

	def best_answer
		@answers.first
	end

end
