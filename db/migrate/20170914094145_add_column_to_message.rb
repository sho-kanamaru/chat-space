class AddColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :read_flg, :integer, default: 0
  end
end
