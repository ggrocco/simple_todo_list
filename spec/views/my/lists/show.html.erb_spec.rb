# frozen_string_literal: true

require 'rails_helper'

describe 'my/lists/show.html.erb' do
  before do
    assign(:list, build(:list, name: 'Name', id: 1, private: false))
  end

  it 'renders attributes in <p>' do
    allow(view).to receive(:user_signed_in?).and_return(false)

    render

    expect(rendered).to match(/Name/)
    expect(rendered).to match(/public-.*\.png/)
  end
end
