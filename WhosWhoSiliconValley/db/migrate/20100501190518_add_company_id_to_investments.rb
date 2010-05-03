class AddCompanyIdToInvestments < ActiveRecord::Migration
  def self.up

    add_column :investments, :company_id, :integer
  
  end

  def self.down
    remove_column :investments, :company_id
  end
end
