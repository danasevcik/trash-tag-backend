class User < ApplicationRecord
  has_secure_password
  # validates :username, uniqueness: {case_sensitive: true}
  # validates :name, presence: true
  has_many :volunteers
  has_many :projects, through: :volunteers
end
