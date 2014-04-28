class AddColumnFormatToContentElement < ActiveRecord::Migration
    def change
     add_column :content_elements, :format_id, :integer
    end
  end