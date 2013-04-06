# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :complaint do
    booking_id 1
    problem "MyText"
    resolved false
    issues "MyText"
  end
end
