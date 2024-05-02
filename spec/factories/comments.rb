FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    gossip { nil }
  end
end
