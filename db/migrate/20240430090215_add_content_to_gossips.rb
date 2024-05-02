class AddContentToGossips < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:gossips, :content)
      add_column :gossips, :content, :text
    end
  end
