class RemoveColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :read_flg
  end
end
