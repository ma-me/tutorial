require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it 'should get home' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #help' do
    it 'should get help' do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #about' do
    it 'should get about' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #contact' do
    it 'should get contact' do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

end
