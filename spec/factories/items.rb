FactoryGirl.define do
  factory :item do
    name { Faker::Hacker.say_something_smart }
    user
  end
end
