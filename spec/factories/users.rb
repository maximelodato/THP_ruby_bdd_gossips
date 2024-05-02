FactoryBot.define do
    factory :user do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      city { FactoryBot.create(:city) } 
      username { Faker::Internet.username(specifier: 5..8) }
    end
  end