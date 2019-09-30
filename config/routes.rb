Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

  # root 'scrapers#urlscrap'
  root "static_pages#root"
  # root "nutrition_scrapers#import"

  # get '/urlscrap' => 'scrapers#urlscrap'
  get '/recipescrap' => 'scrapers#recipe_scrap'

  # namespace :api, defaults: { format: :json } do 
  #   resources :recipes do 
  #     collection do  
  #       get :search 
  #     end
  #   end
  # end

  namespace :api, defaults: {format: :json} do
    resources :recipes, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy, :show]
  end
end
