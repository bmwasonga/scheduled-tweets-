class User < ApplicationRecord
  has_many :twitter_accounts
  # this is a ruby method.
  # uses the password digest column in the DB to add a password and a password conformation to the user model
  has_secure_password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email addedss" }, uniqueness: true
end
