class AddToSubscribedTos < ActiveRecord::Migration
  def change
    add_column :subscribed_tos, :end_date, :integer
    add_column :subscribed_tos, :subscription_type, :string    
  end
end