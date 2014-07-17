json.array!(@salutations) do |salutation|
  json.extract! salutation, :id, :name
  json.url salutation_url(salutation, format: :json)
end
