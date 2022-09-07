class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    errors.add(:end_date, "end date can't be before start date") if end_date < start_date
  end
end
