class Article < ActiveRecord::Base
  
  attr_accessible :name, :user_id, :story_id, :content, :description
  
  belongs_to :story
  belongs_to :user
  belongs_to :publication
  
  has_many :activities, :as => :target
  
end
