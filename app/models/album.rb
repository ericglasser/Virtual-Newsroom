class Album < ActiveRecord::Base
  
  attr_accessible :name, :story_id, :description
  
  belongs_to :story
  belongs_to :user
  belongs_to :publication
  has_many :pictures

end
