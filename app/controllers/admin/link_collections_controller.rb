class Admin::LinkCollectionsController < ApplicationController
  before_filter :authenticate_admin!
  # GET /link_collections
  # GET /link_collections.xml
  def index
    @link_collections = LinkCollection.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @link_collections }
    end
  end

  # GET /link_collections/1
  # GET /link_collections/1.xml
  def show
    @link_collection = LinkCollection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @link_collection }
    end
  end

  # GET /link_collections/new
  # GET /link_collections/new.xml
  def new
    @link_collection = LinkCollection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link_collection }
    end
  end

  # GET /link_collections/1/edit
  def edit
    @link_collection = LinkCollection.find(params[:id])
  end

  # POST /link_collections
  # POST /link_collections.xml
  def create
    @link_collection = LinkCollection.new(params[:link_collection])

    respond_to do |format|
      if @link_collection.save
        format.html { redirect_to(@link_collection, :notice => 'Link collection was successfully created.') }
        format.xml  { render :xml => @link_collection, :status => :created, :location => @link_collection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link_collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /link_collections/1
  # PUT /link_collections/1.xml
  def update
    @link_collection = LinkCollection.find(params[:id])

    respond_to do |format|
      if @link_collection.update_attributes(params[:link_collection])
        format.html { redirect_to(@link_collection, :notice => 'Link collection was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link_collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /link_collections/1
  # DELETE /link_collections/1.xml
  def destroy
    @link_collection = LinkCollection.find(params[:id])
    @link_collection.destroy

    respond_to do |format|
      format.html { redirect_to(link_collections_url) }
      format.xml  { head :ok }
    end
  end
end
