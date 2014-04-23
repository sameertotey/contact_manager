# This will guess the Person class
FactoryGirl.define do
  factory :person do
    first_name "Alice"
    last_name  "Smith"
    user
  end
end