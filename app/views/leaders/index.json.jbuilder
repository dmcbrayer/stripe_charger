json.array!(@leaders) do |leader|
  json.extract! leader, :id, :name, :email
  json.url leader_url(leader, format: :json)
end
