Rails.application.routes.draw do
  namespace :admin do
    root 'base#index'   
    resources :categories do
      match 'activate' => 'categories#activate', via: [:get]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
