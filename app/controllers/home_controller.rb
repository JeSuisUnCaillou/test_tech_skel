class HomeController < ApplicationController
	before_filter :authenticate_user!

	def index
		@r = AmazonConnector.new.ask("caca")
	end
end
