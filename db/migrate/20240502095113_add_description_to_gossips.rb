class AddDescriptionToGossips < ActiveRecord::Migration[7.1]
  def change
    add_column :gossips, :description, :text
  end
end
