if Rails.env.development?
  Rental.destroy_all
  puts "Rentals successfully deleted!"
  User.destroy_all
  puts "Users successfully deleted!"
  Book.destroy_all
  puts "Books successfully deleted!"
  puts "Database successfully cleaned!"
end

10.times do |i|
  User.create(username: Faker::Internet.username,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              phone_number: Faker::PhoneNumber.phone_number)
end
puts "Ten random users created!"

30.times do |i|
  Book.create(title: Faker::Book.title,
              author: Faker::Book.author,
              publisher: Faker::Book.publisher)
end
puts "Thirty random books created!"
books = Book.all

User.all.each do |user|
  Rental.create(user: user, book: books.sample)
  Rental.create(user: user, book: books.sample)
end
puts "Book rentals for users created!"
puts "Seed successful!"