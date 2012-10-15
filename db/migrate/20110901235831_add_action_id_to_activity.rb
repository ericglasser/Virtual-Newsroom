class AddActionIdToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :action_id, :integer
  end

  def self.down
    remove_column :activities, :action_id
  end
end
