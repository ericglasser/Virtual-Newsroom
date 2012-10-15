class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :name
      t.string :admin
      t.integer :organization_id
      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
