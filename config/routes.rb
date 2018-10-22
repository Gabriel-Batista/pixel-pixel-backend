Rails.application.routes.draw do
    resources :users, only: [:show, :create, :update, :destroy]
    resources :projects, only: [:show, :create, :update, :destroy]
    resources :palettes, only: [:show, :create, :destroy]
    resources :frames, only: [:show, :create, :update, :destroy]
    resources :colors, only: [:create, :update, :destroy]

    post "/login", to: "sessions#login"
    get "/persist", to: "sessions#persist"

    get "/users/:username/projects", to: "users#projects"
    get "/projects/:id/frames", to: "projects#frames"
end
