class AddIsAnonymousToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_anonymous, :boolean
  end
end
