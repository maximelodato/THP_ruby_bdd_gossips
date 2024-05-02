require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "gossips should be associated with users" do
    # Créer un utilisateur avec un gossip associé
    user = FactoryBot.create(:user)
    gossip = FactoryBot.create(:gossip, user: user)

    # Vérifier si le gossip est associé à l'utilisateur
    assert_equal user.id, gossip.user_id
  end
end