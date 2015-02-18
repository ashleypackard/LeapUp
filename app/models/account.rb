class Account < ActiveRecord::Base

	has_many :account_categories, :dependent :destroy
	has_many :posts, :dependent :destroy
	has_many :comments, :dependent :destroy

	has_secure_password

	before_save {email.downcase!}
	validates :first_name, presence: true, length: {maximum: 100}
	validates :last_name, presence: true, length: {maximum: 100}
	
	VALID_EMAIL_REGEX = /\A[a-zA-Z]+[\d]*@wit\.edu+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            				format: { with: VALID_EMAIL_REGEX },
           					uniqueness: { case_sensitive: false}

	validates :password, length: {minimum: 6}

	VALID_PHONE_REGEX = /\A[\d]{10}\z/i
	validates :phone_number, length: {maximum: 10},
													 format: {with: VALID_PHONE_REGEX},
													 allow_blank: true


end
