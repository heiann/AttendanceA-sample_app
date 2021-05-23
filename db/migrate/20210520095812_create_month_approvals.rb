class CreateMonthApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :month_approvals do |t|
      t.integer :applicant_user_id
      t.integer :approval_superior_id
      t.integer :approval_status
      t.datetime :approval_month
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
