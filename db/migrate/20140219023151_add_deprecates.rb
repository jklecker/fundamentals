class AddDeprecates < ActiveRecord::Migration
  def change
    add_column :formats, :hidden, :integer
    add_column :content_areas, :hidden, :integer
    add_column :delivery_modes, :hidden, :integer
    add_column :subscription_types, :hidden, :integer
    add_column :content_elements, :hidden, :integer
  end
end