class CreateSubscriptionType< ActiveRecord::Migration
  def change
    create_table :subscription_types do |t|
      t.string :name
      t.string :subscription_length
      t.references :provider
    end
  end
end