# frozen_string_literal: true

TodoList::Application.routes.draw do
  scope '/my' do
    devise_for :users
  end

  namespace :my do
    resources :lists do
      get :favorites, on: :collection
    end
  end

  resources :lists, only: %i[index show] do
    member do
      post :follow
      post :unfollow
    end
  end

  unauthenticated do
    # as :user do
    #   root :to => 'lists#index'
    # end
  end

  root to: 'my/lists#index'
end
