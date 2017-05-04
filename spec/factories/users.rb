FactoryGirl.define do

  factory :user do
    id                    "1"
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password }
    password_confirmation { password }
  end

end
