# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
john = User.create(name: "John", email: "john@doe", password: "john" )
doe = User.create(name: "Doe", email: "doe@john", password: "doe" )

catan = BoardGame.create(name: "Catan", time_duration: 40, difficulty: 4, rules: "No one wants your sheep")

game = Game.create(user_id: john.id, board_game_id: catan.id, comment: "They weren't kidding, no one want's your sheep")
