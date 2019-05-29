FactoryBot.define do
  factory :job do
    business { nil }
    title { "FAKE TITLE" }
    description { "FAKE DESCRIPTION" }
    pay { 42 }
    available { false }

    trait :available do
      available { true }
    end

    trait :no_title do
      title { "" }
    end

    trait :no_description do
      description { "" }
    end

    trait :no_pay do
      pay { nil }
    end

    trait :no_availability do
      available { nil }
    end
  end

end
