# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    begin_time "1980-01-01 17:00:00"
    end_time "1980-01-01 18:00:00"
    restaurant { FactoryGirl.create(:restaurant) }
    user { FactoryGirl.create(:user) }
    notes "Smoking area"
  end
end
