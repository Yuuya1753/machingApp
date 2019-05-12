class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps
    end
  end
end
