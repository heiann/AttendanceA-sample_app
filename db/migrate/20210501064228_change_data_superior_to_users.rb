class ChangeDataSuperiorToUsers < ActiveRecord::Migration[5.1]
  def change
     change_column :users, :superior, :boolean
  end 
end
