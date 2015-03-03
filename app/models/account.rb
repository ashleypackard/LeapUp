class Account < ActiveRecord::Base

	has_many :account_categories, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_secure_password

	before_save {email.downcase!}
	validates :first_name, presence: true, length: {maximum: 100}
	validates :last_name, presence: true, length: {maximum: 100}
	
	VALID_EMAIL_REGEX = /\A[a-zA-Z]+[\d]*@wit\.edu+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            				format: { with: VALID_EMAIL_REGEX },
           					uniqueness: { case_sensitive: false}

	validates :password, presence: true, length: {minimum: 6}, on: :create
	# validates :password, length: {minimum: 6}, on: :update, allow_blank: :true

	VALID_PHONE_REGEX = /\A[\d]{10}\z/i
	validates :phone_number, length: {maximum: 10},
													 format: {with: VALID_PHONE_REGEX},
													 allow_blank: true
 # Returns a random token.
  def Account.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a accout in the database for use in persistent sessions.
  def remember
    self.remember_token = Account.new_token
    update_attribute(:remember_digest, Account.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a account.
  def forget
    update_attribute(:remember_digest, nil)
  end

end
