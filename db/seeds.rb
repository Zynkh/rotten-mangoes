# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!(
  title: "The Mask",
  director: "Charles Russel",
  runtime_in_minutes: 101,
  description: "Bank clerk Stanley Ipkiss is transformed into a manic super-hero when he wears a mysterious mask.",
  remote_image_url: "http://ia.media-imdb.com/images/M/MV5BMjM3NDI5OTA5Nl5BMl5BanBnXkFtZTgwNzE4ODYxMTE@._V1_SX214_AL_.jpg",
  release_date: "1994-07-29"
  )

Movie.create!(
  title: "The Matrix",
  director: "Andy Wachowski",
  runtime_in_minutes: 136,
  description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
  remote_image_url: "http://ia.media-imdb.com/images/M/MV5BMTkxNDYxOTA4M15BMl5BanBnXkFtZTgwNTk0NzQxMTE@._V1_SX214_AL_.jpg",
  release_date: "1999-03-31"
  )

Movie.create!(
  title: "Blade Runner",
  director: "Ridley Scott",
  runtime_in_minutes: 117,
  description: "A blade runner must pursue and try to terminate four replicants who stole a ship in space and have returned to Earth to find their creator.",
  remote_image_url: "http://ia.media-imdb.com/images/M/MV5BMTA4MDQxNTk2NDheQTJeQWpwZ15BbWU3MDE2NjIyODk@._V1_SX214_AL_.jpg",
  release_date: "1982-06-25"
  )

User.create!(
  email: "m.zach.hill@gmail.com",
  password: "password",
  firstname: "Zach",
  lastname: "Hill",
  admin: true
  )