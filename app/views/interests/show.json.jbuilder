json.array! @interest do |i|
  json.name i.name
  json.address i.address
  json.longitude i.longitude
  json.latitude i.latitude
  json.category i.category
  json.phone i.phone
  json.website i.website
  json.thumbnail_url i.thumbnail.url(:medium)
  json.thubmail_name i.thumbnail_file_name
end
