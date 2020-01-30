json.products @products.each do |product|
	json.name product.name
	json.description product.description
	json.price product.price
	json.make product.make
	json.category_id product.category_id
end