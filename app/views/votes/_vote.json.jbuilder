json.extract! vote, :id, :election_id, :m, :r, :created_at, :updated_at
json.url vote_url(vote, format: :json)
