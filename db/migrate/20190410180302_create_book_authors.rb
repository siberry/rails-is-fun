class CreateBookAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_authors do |t|
      t.belongs_to :author, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
