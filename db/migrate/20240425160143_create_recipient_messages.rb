class CreateRecipientMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :recipient_messages do |t|
      t.belongs_to :recipient, index: true
      t.belongs_to :message, index: true
      t.timestamps
    end
  end
end
