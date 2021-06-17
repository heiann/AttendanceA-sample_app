class RemoveOvertimeEndFromattendances < ActiveRecord::Migration[5.1]
  def change
     remove_column :attendances, :overtime_end, :datetime
  end
end
