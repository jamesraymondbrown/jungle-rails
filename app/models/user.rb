class User < ApplicationRecord
  
  has_secure_password

  def self.authenticate_with_credentials(params_email, params_password)
    email_whitespace_removed = params_email.strip.downcase
    self.find_by(email: email_whitespace_removed)&.authenticate(params_password) 
    # self.authenticate(params_email, params_password)
  end

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  validates_uniqueness_of :email, case_sensitive: false

end
