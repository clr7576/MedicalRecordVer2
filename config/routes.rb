Rails.application.routes.draw do


  resources :animals do
    resources :basal_values, shallow: true do
      member do 
        get :bloodpressure, :respiratory, :summary
      end
    end
   end

   get "/index", to: "discharges#index"
   get "/show", to: "discharges#show"

   
   root "animals#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
