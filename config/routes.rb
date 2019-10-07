Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  get 'home/index'

  resources :assignments

  resources :courses do
    resources :course_assignments do
      resources :submissions do
        get "new_grade"
        post "create_grade"
        get "edit_grade"
        patch "update_grade"
        delete "destroy_grade"
      end
    end
  end

  resources :users

  get '/users/:id/courses/', {to: "courses#index"}
  get '/users/:id/assignments/', {to: "due_assignments#index"}

  get '/admin/archive'
  get '/admin/users'
  get '/admin/courses'

  get '/users/id:/assignments/', {to: "submitted_assignments#index"}

  resources :assignments

  resources :sessions, only: [:create, :destroy, :new]

  resources :users, only: [:new, :create, :edit, :update, :destroy]

  get "login", to: "sessions#new"
  get "sign_in", to: "sessions#new"

  get "admin/courses"
  get "admin/users"
  get "admin/archive"
  
end



