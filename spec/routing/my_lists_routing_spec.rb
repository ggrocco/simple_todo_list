# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing for My::ListsController', type: :routing do
  it 'routes to #index' do
    expect(get: '/my/lists').to route_to('my/lists#index')
  end

  it 'routes to #favorites' do
    expect(get: '/my/lists/favorites').to route_to('my/lists#favorites')
  end

  it 'routes to #show' do
    expect(get: '/my/lists/1').to route_to('my/lists#show', id: '1')
  end

  it 'routes to #new' do
    expect(get: '/my/lists/new').to route_to('my/lists#new')
  end

  it 'routes to #edit' do
    expect(get: '/my/lists/1/edit').to route_to('my/lists#edit', id: '1')
  end

  it 'routes to #create' do
    expect(post: '/my/lists').to route_to('my/lists#create')
  end

  it 'routes to #update' do
    expect(put: '/my/lists/1').to route_to('my/lists#update', id: '1')
  end

  it 'routes to #destroy' do
    expect(delete: '/my/lists/1').to route_to('my/lists#destroy', id: '1')
  end
end
