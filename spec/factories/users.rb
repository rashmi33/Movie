FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name
    address Faker::Address.street_address
    city Faker::Address.city
    phone_no Faker::Number.number(10)
    association :movie_hall, factory: :movie_hall, strategy: :build
    association :audi, factory: :audi, strategy: :build
  end
end