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
    @folder.parent_garvin_folder = GarvinFolder.find(params[:parent])
    @folder.save!
    redirect_to garvin_folder_path(@folder)
  end

  def new
    @parent =  params[:parent]
		@folder = GarvinFolder.new
    render(:layout => false)
  end

  def update
		@folder=GarvinFolder.find(:all)
  end

  def destroy
    @folder = GarvinFolder.find(params[:id])
    @parent = @folder.parent_garvin_folder
    @folder.destroy
    redirect_to :action => :show, :id => @parent
  end

end

