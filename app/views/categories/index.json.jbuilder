json.array! @categories do | c |
  json.name c.name
  json.icon_url c.thumbnail.url
  json.category_id c.id
end
