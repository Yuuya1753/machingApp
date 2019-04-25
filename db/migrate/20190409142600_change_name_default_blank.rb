class ChangeNameDefaultBlank < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :name, :string, default: ""
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
  def down
    change_column :users, :name, :string, default: "testUser"
  end
end
