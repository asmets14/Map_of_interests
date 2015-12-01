@bookmarker.each do |b|
  @book=  Interest.where(:id => (b.interest_id))
  json.array! @book do |i|
    json.id i.id
    json.name i.name
    json.address i.address
    json.longitude i.longitude
    json.latitude i.latitude
    json.category_id i.category_id
    json.phone i.phone
    json.website i.website
    json.thumbnail_url i.thumbnail.url(:medium)
    json.thubmail_name i.thumbnail_file_name
    json.tag_list i.tag_list
  end
end
