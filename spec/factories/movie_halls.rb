FactoryGirl.define do
  factory :movie_hall do
    name Faker::Name.first_name
    address Faker::Address.street_address
    city Faker::Address.city
  end
end