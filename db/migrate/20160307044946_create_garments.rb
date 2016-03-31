class CreateGarments < ActiveRecord::Migration[5.0]
  def change
    create_table :garments do |t|
      t.string     :name
      t.string     :description
      t.references :project

      t.timestamps null: false
    end
  end
end
