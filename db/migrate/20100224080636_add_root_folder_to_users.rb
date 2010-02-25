class AddRootFolderToUsers < ActiveRecord::Migration
  def self.up
		add_column :users, :root_folder, :int
  end

  def self.down
		remove_column :users, :root_folder
  end
end
