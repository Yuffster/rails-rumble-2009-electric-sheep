class CreateBibliographies < ActiveRecord::Migration
  def self.up
    create_table :bibliographies do |t|
      t.integer :user_id
      t.integer :style_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bibliographies
  end
end
