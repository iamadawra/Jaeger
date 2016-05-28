FactoryGirl.define do
  factory :video do
    title "MyString"
    video_url "MyString"
    poster_url "MyString"
    is_in_competition false
    competition_id 1
    uploader_id 1
    tags "MyString"
    uploaded_at "2016-05-22 11:53:12"
    rating 1.5
    voting 1.5
    rate_num 1
    vote_num 1
  end
end
