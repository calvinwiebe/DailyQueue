class QueueController < ApplicationController
  protect_from_forgery :except => :add
  before_filter :authenticate_user!, :except => [ :index ]
  
  def index
    
  end
  
  def show
    
  end
  
  def add
    @link_collection = nil
    @link = Link.new(:url => params[:url])
    if current_user
      if current_user.link_collections.length != 0
        @link_collection = current_user.link_collections.first
      else
        @link_collection = LinkCollection.new(:user_id => current_user.id)
        @link_collection.save
      end
    end
    
    respond_to do |format|
      if @link_collection
        @link.link_collection_id = @link_collection.id
        @link.save
        format.html { redirect_to profile_path, :notice => "link successfully added to queue" }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
        format.json { render :json => @link, :status => :created, :location => @link }
      else
        format.html { redirect_to user_queue_path(params[:user]), :notice => "failed to add link" }
        format.xml  { render :json => @link.errors, :status => "failed" }
        format.json { render :json => @link.errors, :status => "failed" }
      end
    end
  end
  
  def delete
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(profile_path, :notice => "deleted link successfully") }
      format.xml  { head :ok }
    end
  end
end
