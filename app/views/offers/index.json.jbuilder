json.array!(@offers) do |offer|
  json.extract! offer, :id, :name, :buyer_id, :seller_id
  json.url offer_url(offer, format: :json)
end
