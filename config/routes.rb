Rails.application.routes.draw do
  namespace :api do
    get "employees", to: "employees#index"
    post "incidence", to: "incidences#create"
    post "payroll_invoice", to: "payroll_invoices#create"
  end
end
