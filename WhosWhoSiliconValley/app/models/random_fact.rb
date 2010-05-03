# A RandomFact
#  - is associated with a company or a person

class RandomFact < ActiveRecord::Base

  belongs_to :source, :polymorphic => true

end
