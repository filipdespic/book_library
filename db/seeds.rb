10.times do |i|
  User.create(username: Faker::Internet.username,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              phone_number: Faker::PhoneNumber.phone_number)
end

30.times do |i|
  Book.create(title: Faker::Book.title,
              author: Faker::Book.author,
              publisher: Faker::Book.publisher)
end

books = Book.all

User.all.each do |user|
  Rental.create(user: user, book: books.sample)
  Rental.create(user: user, book: books.sample)
end