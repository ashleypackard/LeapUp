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

	scope :filter_by_category, -> (wanted_category_id){where(category_id: wanted_category_id )}
	scope :sort_by_date, -> (wanted_date){order(updated_at: wanted_date )}
	
end
