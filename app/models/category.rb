class Category < ActiveRecord::Base

	has_many :account_categories
	has_many :posts

	validates :name, presence: true

end
