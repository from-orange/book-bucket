json.array!(@bucketters) do |bucketter|
  json.extract! bucketter, :id
  json.url bucketter_url(bucketter, format: :json)
end
