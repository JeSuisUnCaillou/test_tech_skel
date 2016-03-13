module ApplicationHelper
	def set_active(controller, action)
		params["controller"] == controller && params["action"] == action ? "active" : ""
	end
end
