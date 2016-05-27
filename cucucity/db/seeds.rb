# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Video.create(title: 'sample', video_url: 'sample.mp4', poster_url: 'sample_poster.jpg')
Video.create(title: 'sample2', video_url: 'sample2.mp4', poster_url: 'sample2_poster.jpg')
Video.create(title: 'sample3', video_url: 'sample3.mp4', poster_url: 'sample3_poster.jpg')