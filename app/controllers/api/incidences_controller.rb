class Api::IncidencesController < ApplicationController
  # POST /api/incidence
  def create
    @incidence = Incidence.new(incidence_params)

    if @incidence.save
      render json: @incidence, status: :created
    else
      render json: @incidence.errors, status: :unprocessable_entity
    end
  end

  private

  def incidence_params
    params.permit(
      :employee_id, :incidence_type, :concept, :start_date, :end_date, :amount
    )
  end
end
