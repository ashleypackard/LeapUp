class Post < ActiveRecord::Base

	belongs_to :category
	belongs_to :account
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: {maximum: 75}
	validates :body, presence: true, length: {maximum: 5000}
	validates :location, presence: true, length: {maximum: 255}
	validates :meeting_time, presence: true
	validates :meeting_date, presence: true
	validates :account_id, presence: true
	validates :category_id, presence: true

	
end
