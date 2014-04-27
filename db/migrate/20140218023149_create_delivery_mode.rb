class CreateDeliveryMode < ActiveRecord::Migration
  def change
    create_table :delivery_modes do |t|
	    t.string :name
    end
  end
end