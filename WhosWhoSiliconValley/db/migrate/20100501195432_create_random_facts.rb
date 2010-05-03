class CreateRandomFacts < ActiveRecord::Migration
  def self.up
    create_table :random_facts do |t|
      t.string :text

      t.integer :source_id
      t.string :source_type
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :random_facts
  end
end
