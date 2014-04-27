class CreateSubscribedTos < ActiveRecord::Migration
  def change
    create_table :subscribed_types do |t|
      t.string :name
      t.string :subscription_length
      t.references :provider
    end
  end
end