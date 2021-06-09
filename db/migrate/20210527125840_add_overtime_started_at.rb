class AddOvertimeStartedAt < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_started_at, :datetime
  end
end
