class WitConnector
	require 'wit'

	ACCESS_TOKEN = "KQ2FZHZFPFZKUJ2TIUOHMUG6WJKMMBKF"

	attr_accessor :wit_response
	attr_accessor :answers

	def ask(question)
		Wit.init
		@wit_response = Wit.text_query(question, ACCESS_TOKEN)
		Wit.close
		@answers = JSON.parse(@wit_response)["outcomes"]
		return @answers.first["intent"]
	end

	

end
