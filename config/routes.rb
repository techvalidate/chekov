Tester::Application.routes.draw do

  resources :elements

  resources :contexts do
    resources :stories
  end
  
  resources :releases
  
  resources :users
  
  match 'login'=>'sessions#login',         :as=>:login
  match 'authorize'=>'sessions#authorize', :as=>:authorize
  match 'logout'=>'sessions#logout',       :as=>:logout
  
  root :to=>'contexts#index'

end
