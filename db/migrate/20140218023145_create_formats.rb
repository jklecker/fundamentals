class CreateFormats < ActiveRecord::Migration
  def change
    create_table :format do |t|
    t.string :name
    end
  end
end