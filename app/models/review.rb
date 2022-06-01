class Review < ApplicationRecord
  belongs_to :donation
  validates :name, length: { minimum: 4 }, uniqueness: true, presence: true
end
