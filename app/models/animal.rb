class Animal < ApplicationRecord
    acts_as_paranoid
    
    has_many :basal_values, dependent: :destroy
    has_many :urines

    validates :name,presence: true
    validates :species,presence: true
    validates :number,presence: true

end


