FactoryGirl.define do 
  factory :user do
    name "Diner One"
    email "dinerone@example.org"
    password "abc123"
    password_confirmation "abc123"
  end
end