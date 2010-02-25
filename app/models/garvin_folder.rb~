class GarvinFolder < ActiveRecord::Base
  has_one :root_folder
  has_many :garvin_doc
  has_many :garvin_folder, :class_name => "GarvinFolder", :foreign_key => "parent_garvin_folder"
  belongs_to :parent_garvin_folder,:class_name => "GarvinFolder", :foreign_key => "id"
end
