require 'rails_helper'

RSpec.describe 'application' do
  it "displays a specific application's attributes" do

    shelter = Shelter.create(name: 'Aurora shelter',
                             city: 'Aurora, CO',
                            foster_program: false,
                            rank: 9)

    pet_1 = Pet.create(adoptable: true,
                       age: 1, breed: 'sphynx',
                       name: 'Lucille Bald',
                       shelter_id: shelter.id)

    pet_2 = Pet.create(adoptable: true,
                       age: 3, breed: 'doberman',
                       name: 'Lobster',
                       shelter_id: shelter.id)

    pet_3 = Pet.create(adoptable: false,
                       age: 2,
                       breed: 'saint bernard',
                       name: 'Beethoven',
                       shelter_id: shelter.id)

    tom_daniels = Application.create!(name: "Tom Daniels",
                                      street_address: "123 Maple",
                                      city: "Tucson",
                                      state: "Arizona",
                                      zip_code: "12345",
                                      description: "I am great with animals.",
                                      application_status: "In Progress")

    ApplicationPet.create!(pet: pet_1, application: tom_daniels)
    ApplicationPet.create!(pet: pet_2, application: tom_daniels)

    visit "/applications/#{tom_daniels.id}"

    expect(page).to have_content(tom_daniels.name)
    expect(page).to have_content(tom_daniels.city)
    expect(page).to have_content(tom_daniels.state)
    expect(page).to have_content(tom_daniels.zip_code)

    expect(ApplicationPet.count).to eq(2)
    expect(tom_daniels.pets).to eq([pet_1, pet_2])
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)

    click_link(pet_1.name)

    expect(current_path).to eq("/pets/#{pet_1.id}")
  end

  it "displays a section on the page called 'Add a Pet to this Application'" do

    shelter = Shelter.create(name: 'Aurora shelter',
                             city: 'Aurora, CO',
                            foster_program: false,
                            rank: 9)

    pet_1 = Pet.create(adoptable: true,
                       age: 1, breed: 'sphynx',
                       name: 'Lucille Bald',
                       shelter_id: shelter.id)

    pet_2 = Pet.create(adoptable: true,
                       age: 3, breed: 'doberman',
                       name: 'Lobster',
                       shelter_id: shelter.id)

    tom_daniels = Application.create!(name: "Tom Daniels",
                                      street_address: "123 Maple",
                                      city: "Tucson",
                                      state: "Arizona",
                                      zip_code: "12345",
                                      description: "I am great with animals.",
                                      application_status: "In Progress")

    visit "/applications/#{tom_daniels.id}"

    expect(page).to have_content("Add a Pet to this Application")
    expect(page).to have_button("Submit")

    fill_in("search", with: "Hank")
    click_button("Submit")

    expect(current_path).to eq("/applications/#{tom_daniels.id}")
  end

  it "displays a button to adopt a pet and when clicked, that pet is added to the application" do

    shelter = Shelter.create(name: 'Aurora shelter',
                             city: 'Aurora, CO',
                            foster_program: false,
                            rank: 9)

    pet_1 = Pet.create(adoptable: true,
                       age: 1, breed: 'sphynx',
                       name: 'Lucille Bald',
                       shelter_id: shelter.id)

    pet_2 = Pet.create(adoptable: true,
                       age: 3, breed: 'doberman',
                       name: 'Lobster',
                       shelter_id: shelter.id)

    tom_daniels = Application.create!(name: "Tom Daniels",
                                      street_address: "123 Maple",
                                      city: "Tucson",
                                      state: "Arizona",
                                      zip_code: "12345",
                                      description: "I am great with animals.",
                                      application_status: "In Progress")

    visit "/applications/#{tom_daniels.id}"

    expect(page).to have_content("Add a Pet to this Application")
    expect(page).to have_button("Submit")

    fill_in("search", with: pet_1.name)
    click_button("Submit")

    expect(current_path).to eq("/applications/#{tom_daniels.id}")

    expect(page).to have_content("Results")
    expect(page).to have_text(pet_1.name)
    expect(page).to have_button("Adopt this Pet")

    click_button("Adopt this Pet")

    expect(current_path).to eq("/applications/#{tom_daniels.id}")
  end

  it "displays a submit button there is at least 1 pet on the application" do

    shelter = Shelter.create(name: 'Aurora shelter',
                             city: 'Aurora, CO',
                            foster_program: false,
                            rank: 9)

    pet_1 = Pet.create(adoptable: true,
                       age: 1, breed: 'sphynx',
                       name: 'Lucille Bald',
                       shelter_id: shelter.id)

    pet_2 = Pet.create(adoptable: true,
                       age: 3, breed: 'doberman',
                       name: 'Lobster',
                       shelter_id: shelter.id)

    tom_daniels = Application.create!(name: "Tom Daniels",
                                      street_address: "123 Maple",
                                      city: "Tucson",
                                      state: "Arizona",
                                      zip_code: "12345",
                                      description: "I am great with animals.",
                                      application_status: "In Progress")

    ApplicationPet.create!(pet: pet_1, application: tom_daniels)


    visit "/applications/#{tom_daniels.id}"

    expect(page).to have_button("Submit Application")
    click_button("Submit Application")

    expect(current_path).to eq("/applications/#{tom_daniels.id}")

    expect(page).not_to have_content("Add a Pet to this Application")
  end

  it "can search for a partial of a dog name" do

    shelter = Shelter.create(name: 'Aurora shelter',
                             city: 'Aurora, CO',
                             foster_program: false,
                             rank: 9)

    pet_1 = Pet.create(adoptable: true,
                       age: 1, breed: 'sphynx',
                       name: 'Lucille Bald',
                       shelter_id: shelter.id)

    pet_2 = Pet.create(adoptable: true,
                       age: 3, breed: 'doberman',
                       name: 'Lobster',
                       shelter_id: shelter.id)

    tom_daniels = Application.create!(name: "Tom Daniels",
                                      street_address: "123 Maple",
                                      city: "Tucson",
                                      state: "Arizona",
                                      zip_code: "12345",
                                      description: "I am great with animals.",
                                      application_status: "In Progress")

    visit "/applications/#{tom_daniels.id}"

    expect(page).to have_button("Submit")

    fill_in("search", with: "Lob")
    click_button("Submit")

    expect(current_path).to eq("/applications/#{tom_daniels.id}")

    expect(page).to have_content(pet_2.name)
  end
end
