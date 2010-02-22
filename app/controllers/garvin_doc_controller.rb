class GarvinDocController < ApplicationController
  def index
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
  end
  
  def test
    @doc = GarvinDoc.find(:all)
  end

end
