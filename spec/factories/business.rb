FactoryBot.define do
  factory :business do
    name {"TEST BUSINESS"}
    jobs {[]}

    trait :WithFullJobSalary92K do
        jobs { [Job.new(title: "FAKE JOB WITH SALARY 92000", pay: 92000, description: "FAKE DESCRIPTION", available: "true")] }
    end

    trait :WithfullJobSalary100K do
      jobs { [Job.new(title: "FAKE JOB WITH SALARY 92000", pay: 92000, description: "FAKE DESCRIPTION", available: "true")] }
    end
  end

end
