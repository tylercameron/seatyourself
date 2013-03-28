# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "BurgerPlace"
    address "123 Elm"
    phone "555-1212"
    picture "burgerplace.jpg"
    description "Burgers!"
    category do 
      FactoryGirl.create(:category)
    end
  end
end
