class AddOvertimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime, :time
  end
end
