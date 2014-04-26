class CreateContentArea < ActiveRecord::Migration
  def self.up
    create_table(:ContentAreas) do |t|
      t.string :name
   end
  end
end