Rails.application.routes.draw do
  devise_for :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  resources :lessons do
    member do
      get :vocabulary
      get :grammar
      get :practice_reading
      get :conversation
      get :practice_listening
    end
  end
end
