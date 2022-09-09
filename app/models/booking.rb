class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  enum :status, {
    pending: 0,
    accepted: 1,
    declined: 2
  }

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    if start_date.nil?
      errors.add(:start_date)
    elsif end_date.nil?
      errors.add(:end_date)
    elsif end_date < start_date
      errors.add(:end_date, "end date can't be before start date")
    end
  end
end
