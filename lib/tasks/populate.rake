namespace :db do
    desc "Generate fake data for Users and Gossips"
    task populate: :environment do
      10.times do
        user = FactoryBot.create(:user)
        5.times do
          FactoryBot.create(:gossip, user: user)
        end
      end
    end
  end
  