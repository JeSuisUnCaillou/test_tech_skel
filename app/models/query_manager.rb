#TODO Might need to be splitted into QueryClassifier & QueryIdentifier
# 		QueryClassifier : tag et classe les requêtes dans une ou plusieurs catégories, à l'aide de WitConnector
# 		QueryIdentifier : identifie les requêtes classées automatiquement traitables et les traite à l'aide de AmazonConnector
class QueryManager

	WIT_AMAZON_CATEGORIES = {
		'buy_books' => 'Books',
		'buy_car' => 'Automotive',
		nil => 'All'
	}
	
	def natural_amazon_search(sentence)
		wit = WitConnector.new
		amazon = AmazonConnector.new
		wit.ask(sentence)

		category = WIT_AMAZON_CATEGORIES[wit.best_answer_intent]
		#Didn't find how to ask amazon only under a specific price yet :/
		max_price = wit.best_answer_prices

		amazon.ask(sentence, category)
		ap wit.wit_response
		ap amazon.amazon_response
		return amazon.answers
	end
end
