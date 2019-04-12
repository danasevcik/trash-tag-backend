class Project < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :start_image, presence: true
  validates :time, presence: true
  has_many :volunteers
  has_many :users, through: :volunteers
end
