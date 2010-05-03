# A Company
# - can take investment
# - can invest
# - can have people that are associated through roles
# - can have random facts

class Company < ActiveRecord::Base
  
  has_many :people, :through => :roles
  has_many :investments, :as => :investor
  has_many :roles
  
  # this is not really good form, but I wanted to try the :class_name thingy
  has_many :investments_taken, :class_name => "Investment"

  has_many :random_facts, :as => :source

end
