crumb :root do
  link 'Home', root_path
end

crumb :post do |post|
  link post.title, root_path
  parent :root
end

crumb :categories do
  link 'Categories', categories_path
  parent :root
end

crumb :category do |category_name|
  link category_name, root_path
  parent :categories
end

crumb :tags do
  link 'Tags', tags_path
  parent :root
end

crumb :tag do |tag_name|
  link tag_name, root_path
  parent :tags
end
