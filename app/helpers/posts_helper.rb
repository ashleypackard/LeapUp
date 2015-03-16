module PostsHelper

	def getUserFullName(id)
		user = Account.find(id)
		user.first_name + ' ' + user.last_name
	end

	def getCategory(id)
		category = Category.find(id)
		category.name
	end

	def getCategoryName(id)
		name = getCategory(id)
		name.gsub(/\s+/, "").downcase
	end

end
