Rails.application.routes.draw do
  namespace :api do
    get "employees", to: "employees#index"
    get "employee/:id/payroll_invoices",
      to: "employees#payroll_invoices",
      as: :employee_payroll_invoices
    post "incidence", to: "incidences#create"
    post "payroll_invoice", to: "payroll_invoices#create"
  end
end
