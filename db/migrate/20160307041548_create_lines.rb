class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string     :name
      t.string     :season
      t.string     :year
      t.references :organization

      t.timestamps null: false
    end
  end
end
