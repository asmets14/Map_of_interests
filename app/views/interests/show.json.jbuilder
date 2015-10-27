json.array! @interest do |i|
  json.name i.name
  json.address i.address
  json.longitude i.longitude
  json.latitude i.latitude
  json.category i.category
  json.thumbnail_url i.thumbnail.url(:medium)
end
