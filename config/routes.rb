Rails.application.routes.draw do
    resources :users, only: [:show, :create, :edit, :delete]
    resources :projects, only: [:show, :create, :edit, :delete]
    resources :palettes, only: [:show, :create, :delete]
    resources :frames, only: [:show, :create, :edit, :delete]
    resources :colors, only: [:create, :edit, :delete]

    post "/login", to: "sessions#login"
    get "/persist", to: "sessions#persist"

    get "/users/:username/projects", to: "users#projects"
    get "/projects/:id/frames", to: "projects#frames"
end
