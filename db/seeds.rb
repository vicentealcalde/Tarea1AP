# Importar el módulo Faker
require 'faker'

# Establecer el idioma en inglés
Faker::Config.locale = 'en'

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
300.times do
  author = Author.all.sample
  book = author.books.create(
    name: Faker::Book.title,
    summary: Faker::Lorem.paragraph,
    date_of_publication: Faker::Date.between(from: 10.years.ago, to: 5.years.ago),
    number_of_sales: rand(100..1000)
  )

  # Crear entre 1 y 10 reseñas por libro
  rand(1..10).times do
    book.reviews.create(
      review: Faker::Lorem.paragraph,
      score: rand(1..5),
      number_of_upvotes: rand(0..100)
    )
  end

  # Crear al menos 5 años de ventas por libro
  (0..4).each do |year_offset|
    year = Date.current.year - year_offset
    book.sales.create(
      year: year,
      sales: rand(1..1000)
    )
  end
end
