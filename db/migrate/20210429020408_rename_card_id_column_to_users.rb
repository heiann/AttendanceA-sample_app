class RenameCardIdColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :card_id, :uid
  end
end
