FactoryGirl.define do
  factory :audi do
    code "A7878A"
    no_of_seats Faker::Number.number(2)
    association :movie_hall, factory: :movie_hall, strategy: :build
  end  
end