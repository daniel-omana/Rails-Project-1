class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.integer :isbn13
      t.integer :number_of_pages
      t.decimal :rating
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
