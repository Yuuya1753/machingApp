class AddInfoColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :blood_type, :string
    add_column :users, :address, :string
    add_column :users, :birthplace, :string
    add_column :users, :job, :string
    add_column :users, :hobby, :string
    add_column :users, :self_introduction, :text, limit: 200
    add_column :users, :image, :string
  end
end
