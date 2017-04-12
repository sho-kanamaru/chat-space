class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_users do |t|
      t.integer :groups_id, foreign_key: true
      t.integer :users_id, foreign_key: true
      t.timestamps null: false
    end
  end
end
