# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CulturesController, type: :controller do
  let(:culture) { create(:culture) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: culture.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: culture.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH#update' do
    let(:update) { patch :update, params: { id: culture.id, culture: { name: "test update" } } }

    let(:wrong_update) { patch :update, params: { id: culture.id, culture: { name: nil } } }

    describe 'correct data' do
      before do
        update
        culture
      end

      it 'updates the values' do
        expect(culture.reload.name).to eq "test update"
      end

      it 'redirects to the created culture' do
        expect(update).to redirect_to culture_path(culture.id)
      end

      it 'displays flash notice' do
        expect(controller).to set_flash[:notice]
      end
    end

    describe 'wrong data' do
      before do
        wrong_update
        culture
      end

      it 'redirects to #edit on failure' do
        expect(response).to render_template(:edit)
      end

      it 'displays flash alert' do
        expect(controller).to set_flash[:alert]
      end
    end
  end
end
