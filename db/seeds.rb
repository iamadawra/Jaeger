# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
30.times do |n|
  title  = "sample#{n+1}"
  video_url = "sample#{n+1}.mp4"
  poster_url = "sample#{n+1}.jpg"
  tags = ["funny:pet", "pet:animal", "animal;funny;pet"]
  Video.create!(title: title, video_url: video_url, poster_url: poster_url, uploader_id: "#{n%3+1}", tags: tags[n%3])
end

10.times do |n|
  email  = "a#{n+1}@c3.com"
  password = "0000"
  User.create!(email: email, password: password)
end

10.times do |n|
  vid  = n+1
  cid = n%3+1
  VcRelation.create!(video_id: vid, competition_id: cid)
end