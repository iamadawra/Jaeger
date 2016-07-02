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
  tags = ["funny,pet", "pet,animal", "animal,funny,pet"]
  Video.create!(title: title, video_url: video_url, poster_url: poster_url, uploader_id: "#{n%3+1}", tags: tags[n%3])
end

10.times do |n|
  email  = "a#{n+1}@c3.com"
  password = "0000"
  username = "user#{n+1}"
  User.create!(email: email, password: password, username: username)
end

10.times do |n|
  vid  = n+1
  cid = n%3+1
  VcRelation.create!(video_id: vid, competition_id: cid)
end

5.times do |n|
  vid  = n+1
  cid = (n+1)%3+1
  VcRelation.create!(video_id: vid, competition_id: cid)
end

3.times do |n|
  id = n+1
  title  = "The Funniest Videos in the world #{n+1}"
  desc = "Funny videos 2016 : try not to laugh, smile, or grin while watching this funniest video ever of stupid people doing stupid things compilation. This video is so hilarious and impossible to not laugh includes funny vines, funny pranks and funny fails"
  start_date = "2016-06-28"
  period = 7
  prize = 1000
  prize_num = 2
  poster = "//cucucity.s3.amazonaws.com/competitions/7b5b3ab9-f004-47f0-9a5e-0ec03023a7a0/poster"
  Competition.create!(id: id, title: title, desc: desc, start_date: start_date, period: period, prize: prize, prize_num: prize_num, poster: poster)
end