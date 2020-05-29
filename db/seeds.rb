10.times do
User.create(
    username: Faker::Name.name,  
    email: Faker::Internet.email, 
    password: "password"
    )

Book.create(
    title: Faker::Book.title, 
    author: Faker::Book.author, 
    description: Faker::Lorem.sentence(word_count: 50)
    )

Genre.create(
    name: Faker::Book.genre
)

Quote.create(
    content: Faker::Quote.yoda
)
end