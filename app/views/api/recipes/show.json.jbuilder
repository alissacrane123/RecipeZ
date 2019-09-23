json.set! "recipe" do 
  json.partial! 'recipe', recipe: @recipe
  # json.photoUrls @listing.photos.map { |file| url_for(file)}
end


json.set! "ingredient" do
  json.partial! "api/ingredients/ingredient", ingredient: @recipe.ingredient 
end