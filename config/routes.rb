Rails.application.routes.draw do
  get 'courses/show'
  get 'courses/archive'

  get 'users/courses'
  
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

  resources :assignments

  resources :sessions, only: [:create, :destroy, :new]

  get "login", to: "sessions#new"
  get "sign_in", to: "sessions#new"

end

