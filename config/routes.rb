Rails.application.routes.draw do
  devise_for :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Trestle::Engine.routes.draw do
    get '/alphabets/export_csv', :to => 'alphabets_admin/admin#export_csv'
    post '/alphabets/import_csv', :to => 'alphabets_admin/admin#import_csv'
  end
end
