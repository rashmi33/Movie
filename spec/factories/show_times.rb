FactoryGirl.define do
  factory :show_time do
    time Faker::Time.forward(30, :morning)
  end
end
