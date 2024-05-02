class AddAuthorNameToGossips < ActiveRecord::Migration[7.1]
  def change
    add_column :gossips, :author_name, :string
  end
end
