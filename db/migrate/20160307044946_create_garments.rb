class CreateGarments < ActiveRecord::Migration
  def change
    create_table :garments do |t|
      t.string     :name
      t.string     :description
      t.references :line

      t.timestamps null: false
    end
  end
end
