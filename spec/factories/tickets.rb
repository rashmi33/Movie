FactoryGirl.define do
  factory :ticket do
    code 'A7878A'
    seat_no Faker::Number.number(10)
    association :type_of_ticket, factory: :type_of_ticket, strategy: :build
    association :show_time, factory: :show_time, strategy: :build
  end
end
