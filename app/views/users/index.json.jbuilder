json.array!(@users) do |user|
  json.extract! user, :id, :email, :title_id, :firstname, :middlename, :lastname, :license_num, :type
  json.url user_url(user, format: :json)
end
