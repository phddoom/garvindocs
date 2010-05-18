class GarvinDocController < ApplicationController
  before_filter :login_required
  layout "garvin_doc", :except => [:index]
  
  def index
    @doc = GarvinDoc.find(:all)
  end
  
  def new
    @parent = GarvinFolder.find(params[:id])
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
    @parent = GarvinFolder.find(params[:parent][:id])
    @doc = GarvinDoc.new(params[:doc])
    @doc.garvin_folder = @parent
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
  
  def print
  	@doc = GarvinDoc.find(params[:id])
  	html = File.open("html/#{@doc.title}.html", "w")
  	if html
   		html.syswrite(@doc.body)
		else
   		respond_to do |format|
      format.html {redirect_to :action => 'print_error'}
      format.xml  { head :ok }
		end
		if not system "htmldoc --webpage -f pdf/#{@doc.title}.pdf html/#{@doc.title}.html"
			redirect_to :action => :print_error
		end
		send_file "pdf/#{@doc.title}.pdf", :type=>"application/pdf"#, :x_sendfile=>true
		#perhaps add functionality to delete tmp files created
		#system "rm pdf/#{@doc.title}.pdf html/#{@doc.title}.html"
  end
  
  def print_error
  end

end
