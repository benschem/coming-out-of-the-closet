class User < ApplicationRecord
  has_many :costumes, :bookings

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
