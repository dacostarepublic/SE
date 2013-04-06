# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    user_id 1
    cine_id 1
    movie_imdb_code "MyString"
  end
end
