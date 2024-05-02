FactoryBot.define do
    factory :gossip do
      title { Faker::Lorem.sentence }
      content { Faker::Lorem.paragraph }
      association :user, factory: :user
    end
  end