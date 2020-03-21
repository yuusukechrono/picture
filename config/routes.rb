Rails.application.routes.draw do
  get 'sessions/new'
  root 'sessions#new'
  resources :pictures do
   collection do
    post :confirm
   end
  end

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
end
