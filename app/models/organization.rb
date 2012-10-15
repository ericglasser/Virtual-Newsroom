class Organization < ActiveRecord::Base

  attr_accessible :name, :id 
  has_many :users
  

end
