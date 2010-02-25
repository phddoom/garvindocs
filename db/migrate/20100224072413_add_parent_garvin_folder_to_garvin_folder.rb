class AddParentGarvinFolderToGarvinFolder < ActiveRecord::Migration
  def self.up
		add_column :garvin_folders, :parent_garvin_folder, :int
  end

  def self.down
		remove_column :garvin_folders, :parent_garvin_folder
  end
end
