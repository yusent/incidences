class Api::PayrollInvoicesController < ApplicationController
  # POST /api/payroll_invoice
  def create
    @payroll_invoice = PayrollInvoice.new(payroll_invoice_params)

    if @payroll_invoice.save
      render json: @payroll_invoice, status: :created
    else
      render json: @payroll_invoice.errors, status: :unprocessable_entity
    end
  end

  private

  def payroll_invoice_params
    params.permit(:employee_id, :start_date, :end_date, :concept)
  end
end
