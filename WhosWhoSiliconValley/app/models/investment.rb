# An Investment
# - is associated with the company that was invested in
# - is associated with either a person (angel investor) or a company (VC firm)
class Investment < ActiveRecord::Base
  belongs_to :investor, :polymorphic => true
  belongs_to :company
end
