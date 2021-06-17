class RemoveOvertimeInFromattendances < ActiveRecord::Migration[5.1]
  def change
     remove_column :attendances, :overtime_in, :datetime
  end
end
