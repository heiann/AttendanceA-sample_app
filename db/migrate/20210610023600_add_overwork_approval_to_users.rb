class AddOverworkApprovalToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :over_work_in, :datetime
    add_column :users, :overwork_end, :datetime
    add_column :users, :superior_affiliation, :string
  end
end
