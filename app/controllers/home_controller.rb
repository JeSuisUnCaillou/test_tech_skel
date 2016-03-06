class HomeController < ApplicationController
	def index
		@r = AmazonConnector.new.ask("caca")
	end
end
