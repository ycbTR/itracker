json.array!(@reasons) do |reason|
  json.extract! reason, :id, :name
  json.url reason_url(reason, format: :json)
end
