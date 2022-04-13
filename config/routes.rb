Rails.application.routes.draw do
  namespace :api do
    get "employees", to: "employees#index"
    post "incidence", to: "incidences#create"
  end
end
