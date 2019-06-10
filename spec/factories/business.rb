FactoryBot.define do
  factory :business do
    name {"FAKE BUSINESS"}
    business_type {"FAKE TYPE"}
    jobs {[]}

    trait :with_one_job do
        jobs {
          [
            Job.new(title: "FAKE JOB", pay: 42, description: "FAKE DESCRIPTION", available: true)
          ]
        }
    end

    trait :with_one_unavailable_job do
      jobs {
        [
          Job.new(title: "FAKE UNAVAILABLE JOB", pay: 42, description: "FAKE DESCRIPTION", available: false)
        ]
      }
    end

    trait :with_many_jobs do
      jobs {
          [
            Job.new(title: "FAKE JOB ONE", pay: 1, description: "FAKE DESCRIPTION", available: true),
            Job.new(title: "FAKE JOB TWO", pay: 2, description: "FAKE DESCRIPTION", available: false),
            Job.new(title: "FAKE JOB THREE", pay: 3, description: "FAKE DESCRIPTION", available: true),
            Job.new(title: "FAKE JOB FOUR", pay: 4, description: "FAKE DESCRIPTION", available: false),
            Job.new(title: "FAKE JOB FIVE", pay: 5, description: "FAKE DESCRIPTION", available: true)
          ]
        }
      end

    trait :with_no_available_jobs do
      jobs {
          [
            Job.new(title: "FAKE JOB ONE", pay: 1, description: "FAKE DESCRIPTION", available: false),
            Job.new(title: "FAKE JOB TWO", pay: 2, description: "FAKE DESCRIPTION", available: false),
            Job.new(title: "FAKE JOB THREE", pay: 3, description: "FAKE DESCRIPTION", available: false),
            Job.new(title: "FAKE JOB FOUR", pay: 4, description: "FAKE DESCRIPTION", available: false),
            Job.new(title: "FAKE JOB FIVE", pay: 5, description: "FAKE DESCRIPTION", available: false)
          ]
        }
    end

  end

end
