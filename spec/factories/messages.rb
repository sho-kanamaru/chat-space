FactoryGirl.define do

  factory :message do
    body     { Faker::Lorem.sentence }
    group
    user
  end

end
