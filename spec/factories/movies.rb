FactoryGirl.define do
  factory :movie do
    name Faker::Date.forward(30)
    duration Faker::Number.number(3)
    movie_type 'U'
    is_bollywood "true"
    genre Faker::Name.first_name
    rating Faker::Number.number(1)
    association :movie_hall, factory: :movie_hall, strategy: :build
    association :audi, factory: :audi, strategy: :build
  end
end