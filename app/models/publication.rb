class Publication < ActiveRecord::Base
  
  attr_accessible :name, :id 
  has_many :users
  has_many :stories
  has_many :articles
  has_many :albums
  has_many :activities
  belongs_to :organization
  
end
