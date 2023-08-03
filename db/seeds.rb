# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Crear autores con datos falsos
50.times do
    Author.create(
      name: Faker::Name.name,
      date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
      country_of_origin: Faker::Address.country,
      short_description: Faker::Lorem.sentence
    )
  end
  
  # Crear libros asociados a autores con datos falsos
  Author.all.each do |author|
    rand(1..5).times do
      author.books.create(
        name: Faker::Book.title,
        summary: Faker::Lorem.paragraph,
        date_of_publication: Faker::Date.between(from: 5.years.ago, to: Date.today),
        number_of_sales: rand(100..1000)
      )
    end
  end
  
  # Crear reseñas asociadas a libros con datos falsos
  Book.all.each do |book|
    rand(1..5).times do
      book.reviews.create(
        review: Faker::Lorem.paragraph,
        score: rand(1..5),
        number_of_upvotes: rand(0..100)
      )
    end
  end
  
  # Crear ventas por año asociadas a libros con datos falsos
  Book.all.each do |book|
    (2015..2021).each do |year|
      book.sales.create(
        year: year,
        sales: rand(0..1000)
      )
    end
  end
  
