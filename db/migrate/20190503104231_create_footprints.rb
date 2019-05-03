class CreateFootprints < ActiveRecord::Migration[5.2]
  def change
    create_table :footprints do |t|
      t.integer :leave_id
      t.integer :leaved_id

      t.timestamps
    end
  end
end
