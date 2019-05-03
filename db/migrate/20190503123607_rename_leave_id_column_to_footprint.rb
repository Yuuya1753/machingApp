class RenameLeaveIdColumnToFootprint < ActiveRecord::Migration[5.2]
  def change
    rename_column :footprints, :leaved_id, :user_id
  end
end
