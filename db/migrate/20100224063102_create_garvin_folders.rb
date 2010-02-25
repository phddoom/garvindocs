class CreateGarvinFolders < ActiveRecord::Migration
  def self.up
    create_table :garvin_folders do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :garvin_folders
  end
end
