class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.integer :user_id
      t.integer :community_id

      t.timestamps
    end
  end
end
