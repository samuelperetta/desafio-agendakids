module ApplicationHelper

	def isPath(path, controller) 
		if path.include? controller
			return 'active'
		end
	end
end
