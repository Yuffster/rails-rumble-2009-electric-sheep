class CreateCitations < ActiveRecord::Migration
  def self.up
    create_table :citations do |t|
      t.integer :bibliography_id
      t.string :title
      t.string :publication_title
      t.string :editor
      t.datetime :date
      t.string :publisher
      t.string :publishing_city
      t.string :pages
      t.string :imported_from
      t.datetime :imported_at
      t.integer :volume
      t.integer :issue
      t.string :tags
      t.string :reference_medium
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :citations
  end
end
