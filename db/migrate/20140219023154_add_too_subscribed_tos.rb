class AddTooSubscribedTos < ActiveRecord::Migration
  def change
    add_column :subscribed_tos, :hidden, :integer   
  end
end