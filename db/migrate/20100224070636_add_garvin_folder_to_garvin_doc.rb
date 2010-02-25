class AddGarvinFolderToGarvinDoc < ActiveRecord::Migration
  def self.up
		add_column :garvin_docs, :garvin_folder_id, :int
  end

  def self.down
		remove_column :garvin_docs, :garvin_folder_id
  end
end
