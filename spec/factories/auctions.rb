FactoryGirl.define do
  factory :auction do
    sequence(:title) {|n| "#{Faker::Company.catch_phrase}-#{n}"}
    details          Faker::Lorem.paragraph
    ends_on          "2015-7-25"
    reserve_price    1
  end

end
