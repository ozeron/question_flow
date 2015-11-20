FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.sentence(3) }
    text { Faker::Lorem.paragraph(3, true, 4) }

    trait :with_answer do
      after(:create) do |question|
        create :answer, question: question
      end
    end

    factory :invalid_question do
      title ''
      text ''
    end
  end
end
