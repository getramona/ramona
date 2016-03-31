class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.references :user,       null: false
      t.integer    :group_id,   null: false
      t.string     :group_type, null: false
      t.integer    :role,       default: 0

      t.timestamps null: false
    end

    add_index :memberships, [ :group_id, :group_type ]
  end
end
