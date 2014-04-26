class AddContentArea < ActiveRecord::Migration
  def change
    add_column :providers, :content_area_id, :integer
    add_column :providers, :contentd_delivery_id, :integer
    
  end
end