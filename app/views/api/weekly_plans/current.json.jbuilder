json.set! "weekly_plan" do 
  json.partial! 'weekly_plan', weekly_plan: @weekly_plan
end


json.set! "meals" do 
  @weekly_plan.meals.each do |meal|
    json.set! meal.id do
      json.partial! "api/meals/meal", meal: meal
    end 
  end 
end 

json.set! "recipes" do  
  @weekly_plan.meals.each do |meal|
    json.set! meal.recipe_id do
      json.partial! "api/recipes/recipe", recipe: meal.recipe 
    end
  end
end