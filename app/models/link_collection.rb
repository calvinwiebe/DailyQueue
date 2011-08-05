class LinkCollection < ActiveRecord::Base
  belongs_to :user
  has_many :links
  after_destroy :destroy_orphaned_links
  
  private
  
  def destroy_orphaned_links
    links.each do |link|
      link.destroy if !link.link_collection
    end
  end
end
