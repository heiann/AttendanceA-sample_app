class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :employee_number, :intger
    add_column :users, :affiliation, :string
    add_column :users, :superior, :string
  end
end
