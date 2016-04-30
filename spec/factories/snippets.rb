FactoryGirl.define do
  factory :snippet do
    association :kind, factory: :kind
    sequence(:title) { |n| Faker::Hacker.say_something_smart }
    work             { Faker::Lorem.paragraph }
  end
end
