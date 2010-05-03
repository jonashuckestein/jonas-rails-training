class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :firs_name
      t.string :last_name
      t.string :location
      t.datetime :born

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
