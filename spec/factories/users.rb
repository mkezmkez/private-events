FactoryBot.define do
  factory :user do
    username { Faker::Name.name.split(' ')[0..2].join('').downcase }
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end
end
