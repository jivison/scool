Rails.application.routes.draw do
  get 'courses/show'
  # get 'assignments/index'
  # get 'assignments/new'
  # get 'assignments/create'
  # get 'assignments/edit'
  # get 'assignments/update'
  # get 'assignments/delete'
  # get 'assignments/destroy'
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
    post "add_attendance"
  end

  resources :assignments

  resources :sessions, only: [:create, :destroy, :new]

  get "login", to: "sessions#new"
  get "sign_in", to: "sessions#new"

end

