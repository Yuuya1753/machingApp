class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name, null: false, default: ""
      t.integer :created_id, null: false, default: 0
      t.string :icon

      t.timestamps
    end
  end
end
