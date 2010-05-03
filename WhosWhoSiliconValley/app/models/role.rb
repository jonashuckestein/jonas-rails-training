# A Role
# - connects companies and persons
class Role < ActiveRecord::Base
  belongs_to :company
  belongs_to :person
end
