# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

50.times do
    Tweet.create(tw_content: 
        Faker::Movies::PrincessBride.quote,
        user_id: rand(1..8)
    )
end

#Active admin credentials
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') #if Rails.env.development?

# if there is no OAuth application created, create them
if Doorkeeper::Application.count.zero?
    Doorkeeper::Application.create(name: "Heroku client", redirect_uri: "", scopes: "")
end