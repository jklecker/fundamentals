class AddColumnContentElement < ActiveRecord::Migration
  def change
    delete_column :content_elements, :provider_id, :references
    add_column :content_elements, :provider_id, :integer
  end
end