class GarvinDocController < ApplicationController
  before_filter :login_required
  layout "garvin_doc", :except => [:index]
  
  def index
    @doc = GarvinDoc.find(:all)
  end
  
  def new
    @doc = GarvinDoc.new
  end

  def show
    @doc = GarvinDoc.find(params[:id])
  end

  def edit
    @doc = GarvinDoc.find(params[:id])
  end

  def delete
    @doc = GarvinDoc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index'  }
      format.xml  { head :ok }
    end
  end

  def create
    @doc = GarvinDoc.new(params[:doc])
    @doc.save
    respond_to do |format|
      flash[:notice] = 'Document was successfully created.'
      format.html {redirect_to :action => 'edit', :id => @doc.id }
      format.xml  { head :ok }
    end
  end
  
  def update
    @doc = GarvinDoc.find(params[:id])
    @doc.title = params[:doc][:title]
    @doc.body = params[:doc][:body]
    @doc.save
    respond_to do |format|
      flash[:notice] = 'Document was successfully updated.'
      format.html {redirect_to :action => 'edit', :id => @doc.id }
      format.xml  { head :ok }
    end
  end

end
