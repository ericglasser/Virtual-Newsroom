class AddPublicationIdToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :publication_id, :integer
  end

  def self.down
    remove_column :activities, :publication_id
  end
end
