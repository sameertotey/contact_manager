# This will guess the User class
FactoryGirl.define do
  factory :user do
    name "Sample User"
    provider "twitter"
    sequence(:uid) { |n| "user#{n}" }
  end

end