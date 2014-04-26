class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
	    t.string :name
      t.integer :provider_id
      t.string :content_area_id
      t.string :delivery_mode_id
    end
  end
end
