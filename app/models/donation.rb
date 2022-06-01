class Donation < ApplicationRecord
  has_many :reviews
  validates :name, length: { minimum: 4 }
  validates :dob,:last_donate,:city,:blood_group, :presence => true
  validates :contact, length: { is: 10 }
  validates :contact, format: { with: /\A[+-]?\d+\z/, message: "field only allows integer" }
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :contact, uniqueness: true, presence: true
  validate :last_donation_date_cannot_be_in_the_future
  validate :dob_date_cannot_be_in_the_future
  def last_donation_date_cannot_be_in_the_future
    if last_donate.to_time.present? && last_donate.to_time > Date.today
      errors.add(:last_donate, "can't be in the future")
    end
  end    
  def dob_date_cannot_be_in_the_future
    if dob.present? && dob > Date.today
      errors.add(:dob, "can't be in the future")
    end
  end    
end
