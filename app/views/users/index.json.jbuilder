json.array!(@users) do |user|
  json.extract! user, :userid, :password
  json.url user_url(user, format: :json)
end
