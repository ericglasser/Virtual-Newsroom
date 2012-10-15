class Picture < ActiveRecord::Base
  attr_accessible :name, :image, :album_id, :user_id, :article_id, :organization_id, :description
  belongs_to :album
  mount_uploader :image, ImageUploader
end
