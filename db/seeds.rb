# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Video.create!(title: 'sample', video_url: 'sample.mp4', poster_url: 'sample_poster.jpg')

10.times do |n|
  title  = "sample#{n+1}"
  video_url = "sample#{n+1}.mp4"
  poster_url = "sample#{n+1}_poster.jpg"
  Video.create!(title: title, video_url: video_url, poster_url: poster_url)
end