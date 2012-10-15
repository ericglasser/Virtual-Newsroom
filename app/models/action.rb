class Action < ActiveRecord::Base
  attr_accessible :action_type
  
  has_many :activities
  
end
