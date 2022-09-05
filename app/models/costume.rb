class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true, numericality: true
  validates :type, presence: true
end
