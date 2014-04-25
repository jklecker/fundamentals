class CreateSubscribedTos < ActiveRecord::Migration
  def change
    create_table :subscribed_tos do |t|
   	 t.references :user
   	 t.references :provider
     t.integer :subscription_id
     t.integer :id
    end
  end
end
