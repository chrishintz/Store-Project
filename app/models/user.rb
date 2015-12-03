class User < ActiveRecord::Base
  has_secure_password

  # attr_accessable :email, :password, :password_confirmation
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email
end
