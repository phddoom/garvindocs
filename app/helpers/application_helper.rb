# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def folder_link fold
    folder_image = image_tag("/images/folder.png", :border => "0")
    spacer = content_tag("span"," ", :type => "expand")
    folder_name = content_tag("span", fold.name)
    folder_path = garvin_folder_path(fold)
    folder_display = folder_image + spacer + folder_name
    link_to folder_display, folder_path, :class => "folder_link"
  end

end
