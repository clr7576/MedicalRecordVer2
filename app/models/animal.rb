class Animal < ApplicationRecord
    acts_as_paranoid
    
    has_many :basal_values
end


