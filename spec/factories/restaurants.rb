FactoryGirl.define do
  factory :restaurant do
    restaurant_name 'מאמא מיה'
    association :cuisine
    is_ten_bis true
    address 'תל אביב'
  end
end