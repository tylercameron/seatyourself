# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "MyString"
    address "MyString"
    phone "MyString"
    picture "MyString"
    description "MyText"
    category nil
  end
end
