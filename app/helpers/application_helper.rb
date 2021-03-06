module ApplicationHelper
	def full_title(page_title='')
		base_title = "LeapUp"

		if(page_title.empty?)
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def condenseCategoryName(name)
		name.gsub(/\s+/, "").downcase
	end
end
