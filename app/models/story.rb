class Story < ActiveRecord::Base
  
  attr_accessible :name, :editor, :id, :publication_id, :description, :user_id
  belongs_to :publication
  belongs_to :user
  has_many :articles
  has_many :albums
  
  default_scope :order => 'stories.created_at DESC'
  
end
