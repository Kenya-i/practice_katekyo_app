Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#top'

  resources :teachers
  resources :students
  resources :parents
  resources :teacher_sessions
  resources :student_sessions
  resources :parent_sessions
  resources :teacher_boards
  resources :contracts
  get "/signup", to: "signup#signup"
  get "/login", to: "login#login"
end
