class Project < ApplicationRecord
  has_many :volunteers
  has_many :users, through: :volunteers
end
