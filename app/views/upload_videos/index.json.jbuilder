json.array!(@upload_videos) do |upload_video|
  json.extract! upload_video, :id, :title, :video_url, :poster_url, :tags, :video_desc, :is_approved
  json.url upload_video_url(upload_video, format: :json)
end
