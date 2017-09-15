class CreateMessageRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :message_recipients do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.references :message, foreign_key: true
      t.integer :read_flg, default: 0
      t.timestamps
    end
  end
end
