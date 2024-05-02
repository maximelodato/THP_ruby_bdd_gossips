class AddUserNameToGossips < ActiveRecord::Migration[7.1]
  def change
    add_column :gossips, :user_name, :string
  end
end
