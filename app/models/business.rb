class Business < ApplicationRecord
  has_many :jobs, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def available_jobs
    self.jobs.find_all(&:available?)
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
