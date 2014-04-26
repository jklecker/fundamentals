class AddFormatToContentElement < ActiveRecord::Migration
  
  def change
    add_column :content_elements, :format_type, :string
    create_table :format_types do |t|
    t.string :name
    end
  end
end