# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    rating 1.5
    views 1
    trailer_url "MyString"
    description "MyText"
    age "MyString"
    threeD false
    release_date "2013-02-24"
    genres "MyString"
    running_time "2013-02-24 13:58:11"
    directed_by "MyString"
    produced_by "MyString"
    starring "MyText"
    imdb_code "MyString"
  end
end
