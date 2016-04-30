FactoryGirl.define do
  factory :kind do
    sequence(:name) {|n| "#{n}-Faker::Name.first_name") }
  end
end
