Rails.application.routes.draw do
  namespace :api do
    get "employees", to: "employees#index"
  end
end
