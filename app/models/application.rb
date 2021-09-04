class Application < ApplicationRecord
  validates :name, presence: true
  
  has_many :application_pets
  has_many :pets, through: :application_pets
end
