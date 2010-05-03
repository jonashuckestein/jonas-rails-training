class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.datetime :founded
      t.datetime :died

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
