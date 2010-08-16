class RevisionsController < ApplicationController
  
  #Needs to be scoped by document
  def index
    @doc = GarvinDoc.find(params[:doc])
    @revisions = @doc.versions
  end

  def show
    @doc = GarvinDoc.find(params[:doc])
    @revision = @doc.versions.find(params[:id])
  end
end
