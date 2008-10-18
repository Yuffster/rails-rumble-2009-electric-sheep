class BibliographiesController < ApplicationController
  # GET /bibliographies
  # GET /bibliographies.xml
  def index
    @bibliographies = Bibliography.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bibliographies }
    end
  end

  # GET /bibliographies/1
  # GET /bibliographies/1.xml
  def show
    @bibliography = Bibliography.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bibliography }
    end
  end

  # GET /bibliographies/new
  # GET /bibliographies/new.xml
  def new
    @bibliography = Bibliography.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bibliography }
    end
  end

  # GET /bibliographies/1/edit
  def edit
    @bibliography = Bibliography.find(params[:id])
  end

  # POST /bibliographies
  # POST /bibliographies.xml
  def create
    @bibliography = Bibliography.new(params[:bibliography])

    respond_to do |format|
      if @bibliography.save
        flash[:notice] = 'Bibliography was successfully created.'
        format.html { redirect_to(@bibliography) }
        format.xml  { render :xml => @bibliography, :status => :created, :location => @bibliography }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bibliography.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bibliographies/1
  # PUT /bibliographies/1.xml
  def update
    @bibliography = Bibliography.find(params[:id])

    respond_to do |format|
      if @bibliography.update_attributes(params[:bibliography])
        flash[:notice] = 'Bibliography was successfully updated.'
        format.html { redirect_to(@bibliography) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bibliography.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliographies/1
  # DELETE /bibliographies/1.xml
  def destroy
    @bibliography = Bibliography.find(params[:id])
    @bibliography.destroy

    respond_to do |format|
      format.html { redirect_to(bibliographies_url) }
      format.xml  { head :ok }
    end
  end
end
