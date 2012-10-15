class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :name
      t.integer :album_id
      t.integer :user_id
      t.integer :article_id
      t.integer :organization_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
