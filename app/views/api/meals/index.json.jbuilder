@meals.each do |meal|
  json.set! plan.id do 
    json.partial! 'api/meals/meal', meal: meal
  end
end