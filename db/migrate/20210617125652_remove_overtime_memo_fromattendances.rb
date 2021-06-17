class RemoveOvertimeMemoFromattendances < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendances, :overtime_memo, :string
  end
end
