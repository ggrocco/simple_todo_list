# frozen_string_literal: true

require 'rails_helper'

describe 'lists/show.html.erb' do
  before do
    assign(:list, build(:list, name: 'Name', id: 1, private: false))
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
