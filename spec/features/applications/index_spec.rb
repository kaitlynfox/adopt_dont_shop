require 'rails_helper'

RSpec.describe 'the applications index' do
  it 'can list links to Pets, Shelters, Veterinarians, and Veterinary Offices' do
    visit "/applications"

    expect(page).to have_link("Pets")
    expect(page).to have_link("Shelters")
    expect(page).to have_link("Veterinarians")
    expect(page).to have_link("Veterinary Offices")
  end
end
