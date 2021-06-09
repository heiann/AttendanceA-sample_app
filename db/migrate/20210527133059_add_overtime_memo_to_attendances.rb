class AddOvertimeMemoToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_memo, :string
  end
end
