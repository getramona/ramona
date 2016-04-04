class AddFilesToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :file, :string
  end
end
