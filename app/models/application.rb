class Application < ApplicationRecord
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :application_status, presence: true

  has_many :application_pets
  has_many :pets, through: :application_pets

  def is_submitted?
    self.application_status != "In Progress"
  end
end
