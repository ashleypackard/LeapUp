class AccountCategory < ActiveRecord::Base

	belongs_to :account
	belongs_to :category

	validates :account_id, presence: true
	validates :category_id, presence: true

end
