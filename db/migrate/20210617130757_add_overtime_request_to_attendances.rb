class AddOvertimeRequestToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_in, :datetime
    add_column :attendances, :overtime_end, :datetime
    add_column :attendances, :overtime_memo, :string
  end
end
