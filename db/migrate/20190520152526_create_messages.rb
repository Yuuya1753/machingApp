class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :matching_id
      t.string :text
      t.integer :speaker_id

      t.timestamps
    end
  end
end
