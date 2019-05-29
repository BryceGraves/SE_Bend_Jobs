FactoryBot.define do
  factory :business do
    name {"FAKE BUSINESS"}
    jobs {[]}

    trait :with_one_job do
        jobs {
          [
            Job.new(title: "FAKE JOB WITH SALARY 92000", pay: 92000, description: "FAKE DESCRIPTION", available: true)
          ]
        }
    end

    trait :with_many_jobs do
      jobs {
          [
            Job.new(title: "FAKE JOB ONE", pay: 1, description: "FAKE DESCRIPTION", available: true),
            Job.new(title: "FAKE JOB TWO", pay: 2, description: "FAKE DESCRIPTION", available: true),
            Job.new(title: "FAKE JOB THREE", pay: 3, description: "FAKE DESCRIPTION", available: true),
            Job.new(title: "FAKE JOB FOUR", pay: 4, description: "FAKE DESCRIPTION", available: true),
            Job.new(title: "FAKE JOB FIVE", pay: 5, description: "FAKE DESCRIPTION", available: true)
          ] 
        }
    end
  end

end
