require 'rails_helper'

RSpec.describe 'Wages', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/wages/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/wages/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/wages/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/wages/show'
      expect(response).to have_http_status(:success)
    end
  end
end
