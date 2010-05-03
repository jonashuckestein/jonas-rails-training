class FixColumnNames < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.rename :firs_name, :first_name
    end

    change_table :investments do |t|
      t.rename :type, :name
    end
  end
  
  def self.down
    change_table :people do |t|
      t.rename :first_name, :firs_name
    end

    change_table :investments do |t|
      t.rename :name, :type
    end
  end
end
