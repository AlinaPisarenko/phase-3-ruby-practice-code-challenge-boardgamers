# This will delete any existing rows from the Boardgame and Player tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting Boardgame/Player data..."
Boardgame.destroy_all
Player.destroy_all

puts "Creating boardgames..."
catan = Boardgame.create(name: "Settlers of Catan", year_released: 1995)
uno = Boardgame.create(name: "Uno", year_released: 1971)
smallworld = Boardgame.create(name: "Smallworld", year_released: 2009)
chess = Boardgame.create(name: "Chess", year_released: 840)
# yes I know chess was around before then but this was the year the oldest known chess manual
# was written by al-Adli ar-Rumi

puts "Creating players..."
chett = Player.create(first_name: "Chett", last_name: "Tiller")
octavia = Player.create(first_name: "Octavia", last_name: "Butler")
ursula = Player.create(first_name: "Ursula", last_name: "Le Guin")

puts "Creating reviews..."

review_1 = Review.create(content: "love it", hours_played: 3, boardgame_id: rand(1..4), player_id: rand(1..3))
review_2 = Review.create(content: "the best game", hours_played: 4, boardgame_id: rand(1..4), player_id: rand(1..3))
review_3 = Review.create(content: "could be better", hours_played: 2, boardgame_id: rand(1..4), player_id: rand(1..3))
review_4 = Review.create(content: "meh", hours_played: 1, boardgame_id: rand(1..4), player_id: rand(1..3))
review_5 = Review.create(content: "great game", hours_played: 5, boardgame_id: rand(1..4), player_id: rand(1..3))


puts "Seeding done!"
