class Job < ApplicationRecord
  belongs_to :business, optional: true
  validates :title, presence: true
  validates :description, length: { maximum: 1000 }
  validates :pay, numericality: { greater_than_or_equal_to: 0 }
  validates :available, inclusion: { in: [ true, false ] }
end
