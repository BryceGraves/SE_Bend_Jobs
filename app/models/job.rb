class Job < ApplicationRecord
  belongs_to :business, optional: true
  validates :title, uniqueness: true
  validates :description, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
  validates :pay, numericality: { greater_than_or_equal_to: 0 }
  validates :available, inclusion: { in: [ true, false ] }
end
