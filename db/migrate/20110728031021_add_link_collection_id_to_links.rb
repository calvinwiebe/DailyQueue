class AddLinkCollectionIdToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :link_collection_id, :integer
  end

  def self.down
    remove_column :links, :link_collection_id
  end
end
