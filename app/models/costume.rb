class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true, numericality: true
  validates :clothing, presence: true

  include PgSearch::Model
  pg_search_scope :supersearch,
    against: {
      name: 'A',
      description: 'C',
      clothing: 'B',
      price: 'D'
    },
    using: {
      tsearch: { prefix: true }
    }
end
