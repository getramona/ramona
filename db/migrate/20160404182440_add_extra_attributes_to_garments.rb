class AddExtraAttributesToGarments < ActiveRecord::Migration[5.0]
  def change
    change_table :garments do |t|
      t.integer :approval_status, default: 0
      t.string :sku
    end
  end
end
