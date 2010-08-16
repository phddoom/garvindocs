class GarvinDoc < ActiveRecord::Base
  #attr_accessor :body, :title
  versioned
  belongs_to :garvin_folder
end
