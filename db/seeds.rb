# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'
require 'open-uri'

NUMBER_OF_SEED_USERS = 1_000
NUMBER_OF_SEED_DONATIONS = 1_000_000
MAX_NUMBER_OF_DONATION_IMAGES = 25

(0...NUMBER_OF_SEED_USERS).each do

  seed_password = Faker::Alphanumeric.alphanumeric(number: rand(8...129))

  user = User.new(
    email: Faker::Internet.email,
    password: seed_password,
    password_confirmation: seed_password
  )
  # Don't send the confirmation email.
  user.skip_confirmation!
  user.save!
end

(0...NUMBER_OF_SEED_DONATIONS).each do

  donation = Donation.new(
    user: User.find(rand(1..NUMBER_OF_SEED_USERS)),
    name: Faker::Food.dish,
    description: Faker::Food.description,
    latitude: rand(-90..90),
    longitude: rand(-180..180),
    pickup_notes: Faker::Lorem.sentence,
    available_until: Faker::Time.between(from: DateTime.now - 60.days, to: DateTime.now + 60.days),
    is_perishable: Faker::Boolean.boolean,
    requires_preparation: Faker::Boolean.boolean,
    is_vegetarian: Faker::Boolean.boolean,
    is_vegan: Faker::Boolean.boolean,
    is_gluten_free: Faker::Boolean.boolean,
    contains_peanuts: Faker::Boolean.boolean,
    contains_tree_nuts: Faker::Boolean.boolean,
    contains_dairy: Faker::Boolean.boolean,
    contains_soy: Faker::Boolean.boolean,
    contains_egg: Faker::Boolean.boolean,
    contains_fish: Faker::Boolean.boolean,
    contains_shellfish: Faker::Boolean.boolean
  )

  (0...(rand(MAX_NUMBER_OF_DONATION_IMAGES))).each do |i|
    image = open(Faker::LoremFlickr.image)
    donation.images.attach(io: image, filename: "seed_image#{i+1}.jpg")
  end

  donation.save!

end