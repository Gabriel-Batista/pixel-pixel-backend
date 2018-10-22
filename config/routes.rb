Rails.application.routes.draw do
    resources :users, only: [:show, :create, :update, :delete]
    resources :projects, only: [:show, :create, :update, :delete]
    resources :palettes, only: [:show, :create, :delete]
    resources :frames, only: [:show, :create, :update, :delete]
    resources :colors, only: [:create, :update, :delete]

    post "/login", to: "sessions#login"
    get "/persist", to: "sessions#persist"

    get "/users/:username/projects", to: "users#projects"
    get "/projects/:id/frames", to: "projects#frames"
end
