Rails.application.routes.draw do

  resources :tasks, only: [:index, :new, :show, :edit]
  #get 'tasks' => 'tasks#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
