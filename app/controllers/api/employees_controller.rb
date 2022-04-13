class Api::EmployeesController < ApplicationController
  # GET /api/employees
  def index
    @employees = Employee.includes(:active_contract).all
    render json: @employees, include: :active_contract
  end
end
