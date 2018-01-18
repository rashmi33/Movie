FactoryGirl.define do
  factory :booking do
    date_of_movie Faker::Date.forward(30)
    no_of_persons Faker::Number.number(2)
    amount Faker::Number.decimal(5, 2)
    seats_alloted Faker::Number.number(2)
    association :user, factory: :user, strategy: :build
    association :ticket, factory: :ticket, strategy: :build
    association :movie, factory: :movie, strategy: :build
  end
end