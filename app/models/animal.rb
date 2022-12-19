class Animal < ApplicationRecord
    acts_as_paranoid
    
    has_many :basal_values, dependent: :destroy

    validates :name,presence: true
    validates :species,presence: true
    validates :number,presence: true
end


