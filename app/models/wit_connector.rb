class WitConnector
	require 'wit'

	attr_accessor :wit_response
	attr_accessor :answers

	def ask(question)
		return [] if question.blank?

		Wit.init
		#token =ENV["WIT_ACCESS_TOKEN"]
		token = "KQ2FZHZFPFZKUJ2TIUOHMUG6WJKMMBKF"
		@wit_response = JSON.parse(Wit.text_query(question, token))
		Wit.close
		@answers = @wit_response["outcomes"]
	
		if Rails.env.development?	
			ap "Wit Search : #{question}"
			ap "Intent: #{best_answer_intent}"
		end

		return @answers
	end

	def best_answer
		@answers.try(:first)
	end

	def best_answer_intent
		best_answer.present? ? best_answer["intent"] : nil
	end

	def best_answer_prices
		best_answer.present? && best_answer.has_key?("entities") ? best_answer["entities"]["amount_of_money"] : nil
	end
end
