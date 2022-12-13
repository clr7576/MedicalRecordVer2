class BasalValue < ApplicationRecord
  belongs_to :animal

  validates :time,presence: true
  
end
