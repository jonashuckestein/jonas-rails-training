# A Quote
# - was said at a certain time by a person
class Quote < ActiveRecord::Base
  belongs_to :person

  def to_label
    num_words = 7
    words = text.split
    if words.size < num_words
       "\"#{text}\""
    else
      "\"" + words[0,num_words-1].join(" ") + "..." + words[num_words] + "\""
    end
    
  end
end
