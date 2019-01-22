Rails.application.routes.draw do

  root :to => "home#index"

  namespace :admin,:path => "cms" do
    root 'base#index'
    resources :top_brands
    match 'top_brands/set_order' => 'top_brands#set_order', via: [:post]
    resources :categories do
      match 'activate' => 'categories#activate', via: [:get]
    end
    resources :stores do
      match 'activate' => 'stores#activate', via: [:get]
    end
    resources :coupons do
      match 'activate' => 'coupons#activate', via: [:get]
    end
    resources :users do
      match 'activate' => 'users#activate', via: [:get]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
