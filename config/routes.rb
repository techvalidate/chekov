Chekov::Application.routes.draw do

  resources :contexts do
    get 'list', :on=>:collection
    resources :stories do
      resources :suites
    end
  end
  
  resources :assignments
  resources :elements
  resources :releases
  resources :users
  
  get  'login'=>'sessions#login',         :as=>:login
  post 'authorize'=>'sessions#authorize', :as=>:authorize
  get  'logout'=>'sessions#logout',       :as=>:logout
  
  root 'contexts#index'

end
