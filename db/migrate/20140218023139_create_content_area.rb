class CreateContentArea < ActiveRecord::Migration
  def change
    create_table :content_areas do |t|
      t.string :name
   end
  end
end