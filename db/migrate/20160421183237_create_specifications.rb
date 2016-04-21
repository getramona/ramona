class CreateSpecifications < ActiveRecord::Migration[5.0]
  def change
    create_table :specifications do |t|
      t.string :pom
      t.string :measurement
      t.integer :unit, default: 0
      t.references :project

      t.timestamps
    end
  end
end
