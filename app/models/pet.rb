class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true

  belongs_to :shelter
  # Will want dependent: :destroy in order to destroy all applications
  # when we remove a pet 
  has_many :application_pets, dependent: :destroy
  has_many :applications, through: :application_pets, dependent: :destroy

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end
end
