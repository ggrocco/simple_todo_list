# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:not_user_list) { create(:list) }
  let(:public_list) { List.all_public }

  describe 'GET index' do
    it 'assigns all lists as @lists' do
      get :index

      expect(assigns(:lists).to_set).to eq(public_list.to_set)
    end
  end

  describe 'GET show' do
    it 'assigns the requested list as @list' do
      get :show, params: { id: not_user_list.id }

      expect(response).to be_successful
      expect(assigns(:lists)).to eq(not_user_list)
    end
  end

  describe 'POST follow' do
    let(:user) { login_user }

    describe 'with valid params' do
      it 'new favorite' do
        expect do
          post :follow, params: { id: not_user_list.id }
        end.to change(user.favorites, :count).by(1)
      end

      it 'redirects to the user favorites' do
        post :follow, params: { id: not_user_list.id }
        expect(response).to redirect_to(favorites_my_lists_url)
      end
    end

    describe 'with invalid params' do
      it 'render 404 page' do
        post :follow, params: { id: -1 }
        expect(response).to be_not_found
      end
    end
  end

  describe 'POST unfollow' do
    let(:user) { login_user }

    before do
      user.favorites << not_user_list
    end

    it 'unfollow the requested list' do
      expect do
        post :unfollow, params: { id: not_user_list.id }
      end.to change(user.favorites, :count).by(-1)
    end

    it 'redirects to the user favorites' do
      post :unfollow, params: { id: not_user_list.id }
      expect(response).to redirect_to(favorites_my_lists_url)
    end

    it 'with invalid id' do
      post :unfollow, params: { id: -1 }
      expect(response).to be_not_found
    end
  end
end
