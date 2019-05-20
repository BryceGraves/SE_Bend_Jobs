class Business < ApplicationRecord
    has_many :jobs, dependent: :destroy
    validates :name, presence: true

    def hiring?
        jobs.any?(&:available?)
    end

    def available_jobs
        jobs.available?
    end

    def open_job_salaries
        @salaries = jobs.sum(&:pay)
    end

    def remove(job)
        jobs.delete(job)
    end

    def perform(big_dependency)
        big_dependency.execute
        return 42
    end

end
