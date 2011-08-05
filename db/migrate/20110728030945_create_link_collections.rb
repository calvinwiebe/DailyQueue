class CreateLinkCollections < ActiveRecord::Migration
  def self.up
    create_table :link_collections do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :link_collections
  end
end
