class AddOvertimeEndToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_end, :datetime
  end
end
