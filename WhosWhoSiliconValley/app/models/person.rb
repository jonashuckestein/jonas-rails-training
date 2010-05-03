# A Person
# - can invest
# - can have different roles at different companies
# - can have quotes
# - can have random facts
class Person < ActiveRecord::Base

  has_many :quotes
  has_many :roles
  
  # TODO companies should also include companies that are associated through investments
  # (might not be possible)
  has_many :companies, :through => :roles
  
  has_many :investments, :as => :investor
  has_many :random_facts, :as => :source

  # for ActiveScaffold plugin
  def to_label
    "#{first_name} #{last_name}"
  end

end
