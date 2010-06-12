module GarvinFolderHelper
  def path_builder(current_folder)
    parent = current_folder.parent_garvin_folder
    path = current_folder.name.to_s
    while not parent == nil
      path = link_to(parent.name.to_s, parent, :class => "folder_path_link") + "/" + path
      parent = parent.parent_garvin_folder
    end
    path
  end
end

