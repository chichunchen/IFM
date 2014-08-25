class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :course

      t.timestamps
    end
  end
end
