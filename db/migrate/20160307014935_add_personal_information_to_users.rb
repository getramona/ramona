class AddPersonalInformationToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string  :name
      t.integer :role, default: 0
    end
  end
end
