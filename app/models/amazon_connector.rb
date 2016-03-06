class AmazonConnector

	def test_ask(item)
		begin
			ask(item)
		rescue Excon::Errors::BadRequest => e
			ap e.response.body
		end
	end


	def ask(item)
		request = Vacuum.new
		request.configure(
    	aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    	aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    	associate_tag: 'tag'
		)
		#ap ENV["AWS_ACCESS_KEY_ID"]
		#ap ENV["AWS_SECRET_ACCESS_KEY"]
		response = request.item_search(query: {'Keywords' => item, 'SearchIndex' => 'Books'})

		response.to_h
	end

end
