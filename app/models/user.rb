class User < ApplicationRecord
  has_many :volunteers
  has_many :projects, through: :volunteers
end
