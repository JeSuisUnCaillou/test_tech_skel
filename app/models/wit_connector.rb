class WitConnector
	require 'wit'

	attr_accessor :wit_response
	attr_accessor :answers

	def ask(question)
		Wit.init
		@wit_response = JSON.parse(Wit.text_query(question, ENV["WIT_ACCESS_TOKEN"]))
		Wit.close
		@answers = @wit_response["outcomes"]
		
		ap "Wit Search : #{question}"
		ap "Intent: #{best_answer_intent}"
		return @answers
	end

	def best_answer
		@answers.first
	end

	def best_answer_intent
		best_answer.present? ? best_answer["intent"] : nil
	end

	def best_answer_prices
		best_answer.present? && best_answer.has_key?("entities") ? best_answer["entities"]["amount_of_money"] : nil
	end
end
