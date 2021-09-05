# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all models prior to seeding
# Have to put ApplicationPet first because ApplicationPet has foreign keys
# to both Pet and Application
# ApplicationPet.destroy_all
Pet.destroy_all
Shelter.destroy_all
Application.destroy_all

# Create a shelter
@denver_animal_shelter = Shelter.create!(foster_program: false,
                                         name: "Denver Animal Shelter",
                                         city: "Denver",
                                         rank: "3")

# Create pets and associate to a shelter
@gary = @denver_animal_shelter.pets.create!(adoptable: true,
                                            age: 9,
                                            breed: "Australian Shepard",
                                            name: "Gary")

@toshi = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 5,
                                             breed: "Blue Heeler",
                                             name: "Toshi")

@toby = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 3,
                                             breed: "Bulldog",
                                             name: "Toby")

@max = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 3,
                                             breed: "German Shepard",
                                             name: "Max")

@charlie = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 4,
                                             breed: "Poodle",
                                             name: "Charlie")

@coco = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 2,
                                             breed: "Labrador Retriever",
                                             name: "Coco")

@hank = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 10,
                                             breed: "Red Heeler",
                                             name: "Hank")

@rufuss = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 3,
                                             breed: "French Bulldog",
                                             name: "Rufuss")

@pugsly = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 4,
                                             breed: "Pug",
                                             name: "Pugsly")

@teemo = @denver_animal_shelter.pets.create!(adoptable: true,
                                             age: 5,
                                             breed: "Pug",
                                             name: "Teemo")






# Create a shelter
@tampa_animal_shelter = Shelter.create!(foster_program: false,
                                        name: "Tampa Animal Shelter",
                                        city: "Tampa",
                                        rank: "8")

# Create pets and associate to a shelter
@troy = @tampa_animal_shelter.pets.create!(adoptable: true,
                                           age: 2,
                                           breed: "German Shepard",
                                           name: "Troy")

@danny = @tampa_animal_shelter.pets.create!(adoptable: true,
                                           age: 1,
                                           breed: "Pomeranian",
                                           name: "Danny")

@titan = @tampa_animal_shelter.pets.create!(adoptable: true,
                                           age: 2,
                                           breed: "Great Dane",
                                           name: "Titan")

@donald = @tampa_animal_shelter.pets.create!(adoptable: true,
                                           age: 2,
                                           breed: "Doberman",
                                           name: "Donald")

@trey = @tampa_animal_shelter.pets.create!(adoptable: true,
                                           age: 4,
                                           breed: "Great Dane",
                                           name: "Trey")




# Create an application
@tom_haverford = Application.create!(name: "Tom Haverford",
                                     street_address: "426 Maple Street",
                                     city: "Meridian",
                                     state: "Ohio",
                                     zip_code: "47382",
                                     description: "I am great with dogs!",
                                     application_status: "Pending")

@tom_hanks = Application.create!(name: "Tom Hanks",
                                 street_address: "52nd Avenue",
                                 city: "New York City",
                                 state: "New York",
                                 zip_code: "24312",
                                 description: "I have a steady income and can provide.",
                                 application_status: "In Progress")

@carly_johnson = Application.create!(name: "Carly Johnson",
                                     street_address: "8516 Broadway",
                                     city: "Denver",
                                     state: "Colorado",
                                     zip_code: "87352",
                                     description: "I have two other dogs already.",
                                     application_status: "Pending")

@diane_lane = Application.create!(name: "Diane Lane",
                                  street_address: "634 Arrow Lane",
                                  city: "Denver",
                                  state: "Colorado",
                                  zip_code: "34256",
                                  description: "I am ready for my first dog.",
                                  application_status: "In Progress")





# Create an Application_Pet (Joined Table: pet, application)
ApplicationPet.create!(pet: @gary, application: @tom_haverford)
ApplicationPet.create!(pet: @max, application: @tom_haverford)

ApplicationPet.create!(pet: @gary, application: @tom_hanks)
ApplicationPet.create!(pet: @troy, application: @tom_hanks)
ApplicationPet.create!(pet: @titan, application: @tom_hanks)

ApplicationPet.create!(pet: @coco, application: @carly_johnson)

ApplicationPet.create!(pet: @coco, application: @diane_lane)
ApplicationPet.create!(pet: @teemo, application: @diane_lane)
ApplicationPet.create!(pet: @donald, application: @diane_lane)
ApplicationPet.create!(pet: @titan, application: @diane_lane)
