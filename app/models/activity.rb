class Activity < ActiveRecord::Base
  attr_accessible :user_id, :activity_type, :target_id, :target_type, :publication_id, :action_id
  
  belongs_to :user
  belongs_to :publication
  belongs_to :target, :polymorphic => true
  belongs_to :action
  
  default_scope :order => 'activities.created_at DESC', :limit => 10
  
  ARTICLE_ADDED = 1 #target --> model article
  class << self
        def add(user_id, activity_type, target)
          activity = Activity.new(:user_id => user_id, :activity_type => activity_type, :target_id => target.id, :publication_id => target.publication_id, :action_id => activity_type)
          activity.save
        end
end
  
end
