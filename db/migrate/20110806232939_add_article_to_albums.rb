class AddArticleToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :article_id, :integer
  end

  def self.down
    remove_column :albums, :article_id
  end
end
