Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'scrapers#urlscrap'

  get '/recipescrap' => 'scrapers#recipe_scrap'

  get '/urlscrap' => 'scrapers#urlscrap'
end
