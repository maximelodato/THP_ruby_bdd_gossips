class CreateRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipients do |t|
      t.references :recipient, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
