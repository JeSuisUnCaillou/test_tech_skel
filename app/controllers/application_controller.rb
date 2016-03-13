class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def render_unauthorized
		render file: "public/401.html", status: :unauthorized and return
	end
end
