class GarvinFoldersController < ApplicationController
  before_filter :login_required
  
  def index
    @parent=current_user.root_folder
    @folder=@parent.garvin_folder.find(:all)
    @doc=@parent.garvin_doc.find(:all)
  end
	
  def edit
    @folder=current_user.garvin_folder.find(params[:id])
  end

  def show
    @parent=GarvinFolder.find(params[:id])
    @folder=@parent.garvin_folder.find(:all)
    @doc=@parent.garvin_doc.find(:all)
  end

  def edit
		@folder=GarvinFolder.find(:all)
  end

  def create
		@folder = GarvinFolder.new(params[:garvin_folder])
    @folder.parent_garvin_folder = GarvinFolder.find(params[:parent][:id])
    @folder.save!
  end

  def new
    @parents = GarvinFolder.find(:all)
		@folder=GarvinFolder.new
    render(:layout => false)
  end

  def update
		@folder=GarvinFolder.find(:all)
  end

end
