class User < ActiveRecord::Base
  has_many :trips

  has_secure_password

  validates :username, :email, presence: true
  validates :username, uniqueness: {message: "That username is already taken, please use another username"}
  validates :email, uniqueness: {message: "That email is already associated to another account. Please use another email"}
end