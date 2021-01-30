Rails.application.routes.draw do
  scope "/api" do
    delete "todos/completed", to: "todos#destroycompleted"
    resources :todos
    resource :users, only: [:create]
    post "login", to: "users#login"
    get "auto_login", to: "users#auto_login"
    get "categories", to: "categories#index"
    post "categories", to: "categories#create"
    put "categories/:id", to: "categories#update"
    delete "categories/:id", to: "categories#destroy"
  end
end
