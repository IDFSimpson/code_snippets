FactoryGirl.define do
  factory :kind do
    sequence(:name) {|n| Faker::Internet.email.gsub("@", "-#{n}@") }
  end
end
