class CreateAuthorsCitationsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :authors_citations, :id => false, :force => true do |t|
      t.integer :author_id, :citation_id
    end
  end

  def self.down
    drop_table :authors_citations
  end
end
