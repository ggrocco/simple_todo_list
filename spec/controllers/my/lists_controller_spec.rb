# frozen_string_literal: true

require 'rails_helper'

RSpec.describe My::ListsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # List. As you add validations to List, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { name: 'My list' }
  end

  let!(:user) { login_user }

  let(:not_user_list) { create(:list) }

  describe 'GET index' do
    it 'assigns all lists as @lists' do
      get :index
      expect(assigns(:lists).to_set).to eq(user.lists.to_set)
      expect(assigns(:list_feeds)).to eq(user.list_feeds.eager_build)
    end
  end

  describe 'GET show' do
    it 'assigns the requested list as @list' do
      get :show, params: { id: not_user_list.id }
      expect(assigns(:list)).to eq(not_user_list)
    end
  end

  describe 'GET new' do
    it 'assigns a new list as @list' do
      get :new
      expect(assigns(:list)).to be_a_new(List)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested list as @list' do
      list = user.lists.first
      get :edit, params: { id: list.id }
      expect(assigns(:list)).to eq(list)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new List' do
        expect do
          post :create, params: { list: valid_attributes }
        end.to change(List, :count).by(1)
      end

      it 'assigns a newly created list as @list' do
        post :create, params: { list: valid_attributes }
        expect(assigns(:list)).to be_a(List)
        expect(assigns(:list)).to be_persisted
      end

      it 'redirects to the created list' do
        post :create, params: { list: valid_attributes }
        expect(response).to redirect_to(my_list_url(List.last))
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved list as @list' do
        # Trigger the behavior that occurs when invalid params are submitted
        List.any_instance.stub(:save).and_return(false)
        post :create, params: { list: {} }
        expect(assigns(:list)).to be_a_new(List)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        List.stub(:save).and_return(false)
        post :create, params: { list: {} }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested list' do
        list = user.lists.first
        # Assuming there are no other lists in the database, this
        # specifies that the List created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        List.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        put :update, params: { id: list.id, list: { 'these' => 'params' } }
      end

      it 'assigns the requested list as @list' do
        list = user.lists.first
        put :update, params: { id: list.id, list: valid_attributes }
        expect(assigns(:list)).to eq(list)
      end

      it 'redirects to the list' do
        list = user.lists.first
        put :update, params: { id: list.id, list: valid_attributes }
        expect(response).to redirect_to(my_list_path(list))
      end
    end

    describe 'with invalid params' do
      it 'assigns the list as @list' do
        list = user.lists.first
        # Trigger the behavior that occurs when invalid params are submitted
        List.any_instance.stub(:save).and_return(false)
        put :update, params: { id: list.id, list: {} }
        expect(assigns(:list)).to eq(list)
      end

      it "re-renders the 'edit' template" do
        list = user.lists.first
        # Trigger the behavior that occurs when invalid params are submitted
        List.any_instance.stub(:update).and_return(false)
        put :update, params: { id: list.id, list: { name: '' } }
        expect(response).to render_template('edit')
      end

      it 'only the owner can edit' do
        list = not_user_list
        put :update, params: { id: list.id, list: valid_attributes }
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested list' do
      list = user.lists.first
      expect do
        delete :destroy, params: { id: list.id }
      end.to change(List, :count).by(-1)
    end

    it 'redirects to the lists list' do
      list = user.lists.first
      delete :destroy, params: { id: list.id }
      expect(response).to redirect_to(my_lists_url)
    end

    it 'only the owner can destroy' do
      list = not_user_list
      delete :destroy, params: { id: list.id }
      expect(response.status).to eq(404)
    end
  end
end
