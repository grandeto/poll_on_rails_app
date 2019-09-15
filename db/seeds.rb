# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
polls = Poll.create([{ name: 'What is the name of your favourite epic movie?'}])
PollOption.create(option: 'Lord of the Rings', priority: 1, poll: polls.first)
PollOption.create(option: 'Game of Thrones', priority: 2, poll: polls.first)
