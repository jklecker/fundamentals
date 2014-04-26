class CreateContentElement < ActiveRecord::Migration
  def change
    create_table :content_elements do |t|
      t.reference :provider
      t.string :name
      t.string :url_link
  end
end