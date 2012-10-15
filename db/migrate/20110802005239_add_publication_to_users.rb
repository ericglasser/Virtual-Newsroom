class AddPublicationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :publication_id, :integer
  end

  def self.down
    remove_column :users, :publication_id
  end
end
