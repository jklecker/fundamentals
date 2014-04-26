class AddColumnContentElement < ActiveRecord::Migration
  def change
    remove_column :content_elements, :provider, :references
    add_column :content_elements, :provider_id, :integer
  end
end