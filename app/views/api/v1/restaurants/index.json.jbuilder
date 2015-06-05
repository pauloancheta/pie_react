json.array! @restaurants do |restaurant|
  json.id restaurant.id
  json.name restaurant.name
  json.address restaurant.address
  json.phone_number restaurant.phone_number
  json.image_url restaurant.image_url
end