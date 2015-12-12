# This will guess the User class
FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "User #{n}" }
    sequence(:email)  { |n| "someone_#{n}@example.com" }
    password 'f4k3p455w0rd'
  end
end
