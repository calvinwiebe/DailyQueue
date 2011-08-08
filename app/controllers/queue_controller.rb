class QueueController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :except => [ :index ]
  
  def index
    if user_signed_in?
      redirect_to profile_path
    end
  end
  
  def show
    
  end
  
  def add
    if params[:url] == ""
      redirect_to profile_path, :alert => "urls cannot be blank"
    else
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
          flash[:notice] = "link successfully added to queue"
          format.html { redirect_to profile_path }
          format.xml  { render :xml => @link, :status => :created, :location => @link }
          format.json { render :json => @link, :status => :created, :location => @link }
          format.js { @current_item = @link }
        else
          format.html { redirect_to user_queue_path(params[:user]), :alert => "failed to add link" }
          format.xml  { render :json => @link.errors, :status => "failed" }
          format.json { render :json => @link.errors, :status => "failed" }
          format.js
        end
      end
    end
  end
  
  def delete
    @link = Link.find(params[:id])
    @link_collection = LinkCollection.find_by_id(@link.link_collection_id)
    @link.destroy
    
    respond_to do |format|
      flash[:notice] = "deleted link successfully"
      format.html { redirect_to(profile_path) }
      format.js
      format.xml  { head :ok }
    end
  end
end
