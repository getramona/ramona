class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.integer :uploadable_id
      t.string  :uploadable_type

      t.timestamps null: false
    end
  end
end
