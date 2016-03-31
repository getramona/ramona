class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string     :name, null: false
      t.string     :permalink, null: false
      t.references :organization, null: false

      t.timestamps null: false
    end
  end
end
