FactoryGirl.define do
  factory :answer do
    title { Faker::Lorem.sentence(3) }
    text { Faker::Lorem.paragraph(3, true, 4) }

    question

    factory :invalid_answer do
      title ''
      text ''
    end
  end
end
