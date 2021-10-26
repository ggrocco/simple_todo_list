# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routing for ListsController', type: :routing do
  it 'routes to #index' do
    expect(get: '/lists').to route_to('lists#index')
  end

  it 'routes to #show' do
    expect(get: '/lists/1').to route_to('lists#show', id: '1')
  end

  it 'routes to #follow' do
    expect(post: '/lists/1/follow').to route_to('lists#follow', id: '1')
  end

  it 'routes to #unfollow' do
    expect(post: '/lists/1/unfollow').to route_to('lists#unfollow', id: '1')
  end
end
