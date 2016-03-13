#TODO Might need to be splitted into QueryClassifier & QueryIdentifier
# - QueryClassifier : tag et classe les requêtes dans une ou plusieurs catégories, à l'aide de WitConnector
# - QueryIdentifier : identifie les requêtes classées automatiquement traitables et les traite à l'aide de AmazonConnector
#
# Both objects should be able to persist results in database, linked with the search_id
class QueryManager

	WIT_AMAZON_CATEGORIES = {
		'buy_book' => 'Books',
		'buy_car' => 'Automotive',
		nil => 'All'
	}
	
	#return amazon results
	def natural_amazon_search(sentence)
		wit = WitConnector.new
		amazon = AmazonConnector.new
		wit.ask(sentence)

		category = WIT_AMAZON_CATEGORIES[wit.best_answer_intent]
		#Didn't find how to ask amazon a filter for price yet :/
		max_price = wit.best_answer_prices

		amazon.ask(sentence, category)
		return amazon.answers.blank? ? [] : amazon.answers
	end
end
