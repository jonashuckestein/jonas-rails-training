class CreateInvestments < ActiveRecord::Migration
  def self.up
    create_table :investments do |t|
      t.integer :size
      t.float :percentage
      t.string :type
      t.datetime :date
      
      
      t.integer :investor_id
      t.string  :investor_type

      t.timestamps
    end
  end

  def self.down
    drop_table :investments
  end
end
