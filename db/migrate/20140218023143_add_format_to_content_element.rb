class AddFormatToContentElement < ActiveRecord::Migration
  
  def change
    add_column :content_elements, :format_type, :string
  end
end