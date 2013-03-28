# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    begin_time "2013-03-28 11:08:12"
    end_time "2013-03-28 11:08:12"
    restaurant nil
    user nil
    notes "MyText"
  end
end
