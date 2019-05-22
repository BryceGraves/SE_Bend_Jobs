FactoryBot.define do
  factory :job do
    business { nil }
    title { "Fake Title" }
    description { "Fake Description" }
    pay { 15000 }
    available { false }

    trait :nopay do
      pay { nil }
    end

    trait :available do
      available { true }
    end

    trait :new_available do
      available
      created_at { 1.day.ago }
    end

    trait :old_available do
      available
      created_at { 6.months.ago }
    end
  end

end
