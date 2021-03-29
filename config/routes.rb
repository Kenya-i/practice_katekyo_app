Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#top'

  resources :teacher_sessions
  resources :student_sessions
  resources :teachers

  resources :teacher_boards

  resources :students

  resources :parents

  get "/signup", to: "signup#signup"
end
