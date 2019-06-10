class Business < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_one_attached :logo
  validates :name, presence: true, uniqueness: true
  validates :business_type, presence: true

  def available_jobs
    self.jobs.find_all(&:available?)
  end

  def average_pay
    return 0 if self.jobs.size == 0
    total_pay / self.jobs.size
  end

  def hiring?
    self.jobs.any?(&:available?)
  end

  def total_pay
    self.jobs.sum(&:pay)
  end

  def remove(job)
    self.jobs.delete(job).first
  end

end
