class EndedSubscriptions < ActiveRecord::Migration
  def change
    create_table :ended_subscriptons do |t|
   	 t.references :user
   	 t.references :provider
     t.integer :subscription_id
     t.string :subscription_type
     t.integer :end_date
     t.integer :old_id
      t.time :end_date
    end
  end
end