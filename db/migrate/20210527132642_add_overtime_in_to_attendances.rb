class AddOvertimeInToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_in, :datetime
  end
end
