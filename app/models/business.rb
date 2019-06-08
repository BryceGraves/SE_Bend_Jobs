class Business < ApplicationRecord
  has_many :jobs, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def available_jobs
    jobs.find_all(&:available?)
  end

  def hiring?
    jobs.any?(&:available?)
  end

  def total_pay
    jobs.sum(&:pay)
  end

  def remove(job)
    jobs.delete(job)
  end

end
