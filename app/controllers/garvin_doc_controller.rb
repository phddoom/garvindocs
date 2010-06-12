class GarvinDocController < ApplicationController
  before_filter :login_required
  layout "garvin_doc", :except => [:index, :print_error]

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
    #TODO: Make this route to the parent folder after deleting a document
    respond_to do |format|
      format.html { redirect_to :controller => "garvin_folders", :action => 'index'  }
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
    if @doc.save!
      respond_to do |format|
        flash[:notice] = 'Document was successfully updated.'
        format.html {redirect_to :action => 'edit', :id => @doc.id }
        format.xml  { head :ok }
      end
    else
      respond_to do |format|
        flash[:notice] = 'Document was not updated.'
        format.html {redirect_to :action => 'edit', :id => @doc.id }
        format.xml  { head :ok }
      end
    end
  end

  def print
  	@doc = GarvinDoc.find(params[:id])
  	html = File.open("html/#{@doc.title.gsub(" ", "_-_")}.html", "w")
  	if html
   		html.syswrite(@doc.body)
		else
   		respond_to do |format|
      format.html {redirect_to :action => 'print_error'}
      format.xml  { head :ok }
      end
		end
		if not system "htmldoc --jpeg --webpage -f pdf/#{@doc.title.gsub(" ", "_-_")}.pdf html/#{@doc.title.gsub(" ", "_-_")}.html"
			#TODO: Handle errors resulting from system call better
			respond_to do |format|
      format.html {redirect_to :action => 'print_error'}
      format.xml  { head :ok }
      end
		else
			send_file "pdf/#{@doc.title.gsub(" ", "_-_")}.pdf", :type=>"application/pdf"#, :x_sendfile=>true
			#TODO: Add functionality to delete tmp files created
		end
  end

end

