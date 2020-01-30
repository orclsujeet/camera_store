json.categories @categories.each do |category|
	json.name category.name
	json.type category.category_type
	json.model category.model
end