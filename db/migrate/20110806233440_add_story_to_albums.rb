class AddStoryToAlbums < ActiveRecord::Migration
  def self.up
  add_column :albums, :story_id, :integer
  end

  def self.down
    remove_column :albums, :story_id
  end
end
