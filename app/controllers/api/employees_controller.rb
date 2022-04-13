class Api::EmployeesController < ApplicationController
  # GET /api/employees
  def index
    @employees = Employee.includes(:active_contract).all
    render json: @employees, include: :active_contract
  end

  # GET /api/employee/:id/payroll_invoices
  def payroll_invoices
    invoices = PayrollInvoice.where(employee_id: params[:id])
    render json: invoices
  end
end
