# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :seat do
    cine_id 1
    level "MyString"
    row 1
    column 1
  end
end
