class AddPublicationToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :publication_id, :integer
  end

  def self.down
    remove_column :articles, :publication_id
  end
end
