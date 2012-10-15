class AddPublicationToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :publication_id, :integer
  end

  def self.down
    remove_column :albums, :publication_id
  end
end
