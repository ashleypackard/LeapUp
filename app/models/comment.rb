class Comment < ActiveRecord::Base

	belongs_to :post
	belongs_to :account

	validates :account_id, presence: true
	validates :post_id, presence: true
	validates :body, presence: true, length: {maximum: 2500}

end
