FactoryGirl.define do
  factory :review do
    user_name 'Moshe'
    rating 0
    association :restaurant
    remark 'this is a test'
  end
end

