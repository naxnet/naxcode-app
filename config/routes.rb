Rails.application.routes.draw do
  devise_for :professors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :professors do
    resources :courses, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :assignments, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
end
