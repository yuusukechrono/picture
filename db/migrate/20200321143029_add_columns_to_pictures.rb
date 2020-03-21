class AddColumnsToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :created_at, :timestamp
    add_column :pictures, :updated_at, :timestamp
  end
end
