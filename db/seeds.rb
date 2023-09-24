# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "\n== Seeding the database with fixtures =="
# system("bin/rails db:fixtures:load")

# Read about fixtures at https://api.rubyonrails.org/classes/ActiveRecord/FixtureSet.html
user =
  User.first_or_create(
    name: "Alexei",
    email: "alexei@example.com",
    password: "password",
    password_confirmation: "password"
  )
Post.create(
  title: "First post",
  body:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit tincidunt iaculis. Suspendisse eleifend lorem tellus, et pellentesque elit pulvinar ac. Mauris nulla tortor, lacinia in dolor a, ullamcorper tristique ligula. Curabitur mollis a urna quis condimentum. Praesent quis nibh odio. Curabitur elementum luctus feugiat. Morbi sit amet laoreet nibh. Nulla libero urna, ullamcorper nec urna ut, semper rhoncus tortor. Nullam et orci quam.",
  user_id: user.id
)
Post.create(
  title: "Second post",
  body:
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni officia cupiditate eaque ipsam dolores consequuntur. Laborum tempore odit alias rem id reprehenderit recusandae aliquid expedita illo, ab eaque quae quam. Quibusdam exercitationem voluptatem ex maiores corporis laboriosam dolor, inventore accusamus necessitatibus voluptates voluptatum rerum molestias sit vero magni? Ut laboriosam praesentium quam.",
  user_id: user.id
)
