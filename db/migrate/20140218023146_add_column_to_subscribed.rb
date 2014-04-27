class AddColumnToSubscribed < ActiveRecord::Migration
  
  def change
    add_column :subscribed_tos, :subscription_id, :integer
  end
end