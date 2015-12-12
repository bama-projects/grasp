# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :course do
    sequence(:title)  { |n| "Info#{n}" }
    association :owner, factory: :user
  end
  factory :lecture do
    title 'Lecture 1'
    course
  end
end
