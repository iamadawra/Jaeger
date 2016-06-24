json.array!(@competitions) do |competition|
  json.extract! competition, :id, :title, :desc, :start_date, :period, :prize, :prize_num, :poster
  json.url competition_url(competition, format: :json)
end
