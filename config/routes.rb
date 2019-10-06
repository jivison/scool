Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  get 'home/index'

  resources :assignments
  
  resources :courses do
    resources :course_assignments do
      resources :submissions
    end 
  end

  resources :sessions, only: [:create, :destroy, :new]

end

