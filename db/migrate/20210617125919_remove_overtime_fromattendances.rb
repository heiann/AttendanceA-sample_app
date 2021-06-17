class RemoveOvertimeFromattendances < ActiveRecord::Migration[5.1]
  def change
     remove_column :attendances, :overtime, :time
  end
end
