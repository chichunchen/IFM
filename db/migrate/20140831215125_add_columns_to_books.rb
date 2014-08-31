class AddColumnsToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :legal, :boolean
  	add_column :books, :original, :boolean
  end
end
