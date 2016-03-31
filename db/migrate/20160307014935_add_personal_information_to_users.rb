class AddPersonalInformationToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string  :name
      t.string  :username, null: false
      t.integer :role, default: 0
    end
  end
end
