class User < ApplicationRecord
  
  has_secure_password

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates_uniqueness_of :email, case_sensitive: false

end
