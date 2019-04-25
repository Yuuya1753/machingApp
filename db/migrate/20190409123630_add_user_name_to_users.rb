class AddUserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: "testUser"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    add_index :users, :name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
