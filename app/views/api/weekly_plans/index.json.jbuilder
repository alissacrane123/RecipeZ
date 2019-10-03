@weekly_plans.each do |plan|
  json.set! plan.id do 
    json.partial! 'api/weekly_plans/weekly_plan', weekly_plan: plan
  end
end