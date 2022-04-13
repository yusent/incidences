require 'rails_helper'

RSpec.describe Api::IncidencesController, type: :request do
  content_type = "application/json"

  let(:valid_attributes) do
    FactoryBot
      .build(:incidence, employee: FactoryBot.create(:employee))
      .attributes
  end

  let(:invalid_attributes) { Incidence.new.attributes }

  describe "POST /incidence" do
    context "with valid parameters" do
      it "creates a new incidence" do
        expect do
          post api_incidence_url, params: valid_attributes, as: :json
        end.to change(Incidence, :count).by(1)
      end

      it "renders a JSON response with the new incidence" do
        post api_incidence_url, params: valid_attributes, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including(content_type))
      end
    end

    context "with invalid parameters" do
      it "does not create a new incidence" do
        expect { post api_incidence_url, params: invalid_attributes, as: :json }
          .to change(Incidence, :count).by(0)
      end

      it "renders a JSON response with errors" do
        post api_incidence_url, params: invalid_attributes, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including(content_type))
      end
    end
  end
end
